/*
  Warnings:

  - You are about to drop the `IndustryInsights` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_industry_fkey";

-- AlterTable
ALTER TABLE "Assessment" ALTER COLUMN "improvementTip" DROP NOT NULL;

-- DropTable
DROP TABLE "IndustryInsights";

-- DropEnum
DROP TYPE "DemandLevel";

-- DropEnum
DROP TYPE "MarketOutlook";

-- CreateTable
CREATE TABLE "IndustryInsight" (
    "id" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "salaryRanges" JSONB[],
    "growthRate" DOUBLE PRECISION NOT NULL,
    "demandLevel" TEXT NOT NULL,
    "topSkills" TEXT[],
    "marketOutlook" TEXT NOT NULL,
    "keyTrends" TEXT[],
    "recommendedSkills" TEXT[],
    "lastUpdated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nextUpdate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IndustryInsight_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "IndustryInsight_industry_key" ON "IndustryInsight"("industry");

-- CreateIndex
CREATE INDEX "IndustryInsight_industry_idx" ON "IndustryInsight"("industry");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_industry_fkey" FOREIGN KEY ("industry") REFERENCES "IndustryInsight"("industry") ON DELETE SET NULL ON UPDATE CASCADE;
