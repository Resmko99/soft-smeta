import { DataSource, SimpleConsoleLogger } from 'typeorm';

export const connectionSource = new DataSource({
  migrationsTableName: 'migrations',
  type: 'postgres',
  port: 5432,
  host: 'localhost',
  username: 'postgres',
  password: '1',
  database: 'test',
  logging: ['error'],
  logger: new SimpleConsoleLogger(['error']),
  synchronize: false,
  entities: ['src/**/*.entity{.ts,.js}'],
  migrations: ['migrations/*{.ts,.js}'],
});
