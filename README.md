# 🎬 MovieSort

```
 __  __                   _             _____                  _            
|  \/  |                 (_)           / ____|                | |           
| \  / |   ___   __   __  _    ___    | (___     ___    _ __  | |_          
| |\/| |  / _ \  \ \ / / | |  / _ \    \___ \   / _ \  | '__| | __|         
| |  | | | (_) |  \ V /  | | |  __/    ____) | | (_) | | |    | |_          
|_|  |_|  \___/    \_/   |_|  \___|   |_____/   \___/  |_|     \__|         
```

## 📖 Overview

**MovieSort** is a command-line tool designed for those who struggle to pick a movie. Based on the genre provided by the user, it randomly selects a movie of that type. Each execution shows a new suggestion, helping users discover new films in a fun and simple way.

## 🚀 Usage

```bash
moviesort [OPTIONS]
```

### 🔧 Options

| Option             | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| `--genre <genre>`  | Movie genre: <br>1 - Action<br>2 - Horror<br>3 - Sci-Fi<br>4 - Thriller<br>5 - Romance |
| `--n <n>`          | Choose how many movies you want to see (default: 0)                         |
| `--s`              | Get surprised with a random movie from an unknown genre                    |
| `--saga`           | Randomly selects a saga within your chosen genre                           |
| `-h, --help`       | Display help information                                                    |

### 🧩 Subcommands

| Subcommand | Description                            |
|------------|----------------------------------------|
| `clean`    | Clears the list of already watched movies |
| `show`     | Displays the list of watched movies    |


---

📽️ Choose, watch, clear… and repeat! With MovieSort, your next movie night begins at the command line.
