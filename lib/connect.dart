import 'package:mysql1/mysql1.dart';

class Connect {
  static final settings = new ConnectionSettings(
    host: '10.0.2.2',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'school',
  );

  Connect() {
    _init();
  }

  void _init() async {
    try {
      var connention = await MySqlConnection.connect(settings);
      var results = await connention.query('''
      CREATE TABLE IF NOT EXISTS guestbooks (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        message TEXT NOT NULL,
        email VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
      )
    ''');

      // create users table if not exists
      await connention.query('''
      CREATE TABLE IF NOT EXISTS users (
        id INT NOT NULL AUTO_INCREMENT,
        role TINYINT NOT NULL DEFAULT 0,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
      )
    ''');

      // create categories table if not exists
      await connention.query('''
      CREATE TABLE IF NOT EXISTS categories (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
      )
    ''');

      // create posts table if not exists
      await connention.query('''
      CREATE TABLE IF NOT EXISTS posts (
        id INT NOT NULL AUTO_INCREMENT,
        category_id INT NOT NULL,
        thumbnail VARCHAR(255) NOT NULL DEFAULT 'https://via.placeholder.com/150',
        title VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
      )
    ''');

      // create banners table if not exists
      await connention.query('''
      CREATE TABLE IF NOT EXISTS banners (
        id INT NOT NULL AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        image VARCHAR(255) NOT NULL,
        url VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
      )
    ''');
    } catch (e) {
      print(e);
    }
  }
}
