// 玩家角色 - 学者
class Scholar {
    float x, y; // 学者的位置
    float speed = 3; // 学者的移动速度

    Scholar(float x, float y) {
        this.x = x;
        this.y = y;
    }

    void move(int dx, int dy) {
        x += dx * speed;
        y += dy * speed;
    }

    void display() {
        fill(0, 255, 0); // 绿色代表学者
        ellipse(x, y, 20, 20);
    }
}

// 障碍物 - 学术挑战
class Obstacle {
    float x, y;

    Obstacle(float x, float y) {
        this.x = x;
        this.y = y;
    }

    void display() {
        fill(255, 0, 0); // 红色代表障碍
        rect(x, y, 30, 30);
    }
}

Scholar scholar;
Obstacle[] obstacles = new Obstacle[5];

void setup() {
    size(800, 600);
    scholar = new Scholar(width / 2, height / 2);
    for (int i = 0; i < obstacles.length; i++) {
        obstacles[i] = new Obstacle(random(width), random(height));
    }
}

void draw() {
    background(255); // 白色背景
    scholar.display();
    for (Obstacle obstacle : obstacles) {
        obstacle.display();
    }
    handleInput();
}

void handleInput() {
    if (keyPressed) {
        if (key == CODED) {
            if (keyCode == UP) {
                scholar.move(0, -1);
            } else if (keyCode == DOWN) {
                scholar.move(0, 1);
            } else if (keyCode == LEFT) {
                scholar.move(-1, 0);
            } else if (keyCode == RIGHT) {
                scholar.move(1, 0);
            }
        }
    }
}
