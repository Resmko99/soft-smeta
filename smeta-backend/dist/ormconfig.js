"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.connectionSource = void 0;
const typeorm_1 = require("typeorm");
exports.connectionSource = new typeorm_1.DataSource({
    migrationsTableName: 'migrations',
    type: 'postgres',
    port: 5432,
    host: 'localhost',
    username: 'postgres',
    password: '1',
    database: 'test',
    logging: ['error'],
    logger: new typeorm_1.SimpleConsoleLogger(['error']),
    synchronize: false,
    entities: ['src/**/*.entity{.ts,.js}'],
    migrations: ['migrations/*{.ts,.js}'],
});
//# sourceMappingURL=ormconfig.js.map