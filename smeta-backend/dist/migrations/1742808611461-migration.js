"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Migration1742808611461 = void 0;
class Migration1742808611461 {
    name = 'Migration1742808611461';
    async up(queryRunner) {
        await queryRunner.query(`CREATE TABLE "user" ("id" SERIAL NOT NULL, "username" character varying NOT NULL, "password" character varying NOT NULL, "isActive" boolean NOT NULL DEFAULT true, CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY ("id"))`);
    }
    async down(queryRunner) {
        await queryRunner.query(`DROP TABLE "user"`);
    }
}
exports.Migration1742808611461 = Migration1742808611461;
//# sourceMappingURL=1742808611461-migration.js.map