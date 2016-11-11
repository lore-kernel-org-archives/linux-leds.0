From: David Lechner <david@lechnology.com>
Subject: [PATCH] leds: uleds: make max_brightness configurable
Date: Fri, 11 Nov 2016 11:35:29 -0600
Message-ID: <1478885730-23190-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: David Lechner <david@lechnology.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This adds support for configuring max_brightness when setting up a
userspace LED device. It also requires changing the brightness value
returned from a single byte to an integer. Since the uleds driver has
not made it into the mainline kernel yet, this is not breaking userspace.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/leds/uleds.c       | 16 +++++++++++-----
 include/uapi/linux/uleds.h |  1 +
 tools/leds/uledmon.c       |  5 +++--
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
index 2bbc73a..5e9e8a1 100644
--- a/drivers/leds/uleds.c
+++ b/drivers/leds/uleds.c
@@ -39,7 +39,7 @@ struct uleds_device {
 	struct mutex		mutex;
 	enum uleds_state	state;
 	wait_queue_head_t	waitq;
-	unsigned char		brightness;
+	int			brightness;
 	bool			new_data;
 };
 
@@ -67,7 +67,6 @@ static int uleds_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	udev->led_cdev.name = udev->user_dev.name;
-	udev->led_cdev.max_brightness = LED_FULL;
 	udev->led_cdev.brightness_set = uleds_brightness_set;
 
 	mutex_init(&udev->mutex);
@@ -117,6 +116,12 @@ static ssize_t uleds_write(struct file *file, const char __user *buffer,
 		goto out;
 	}
 
+	if (udev->user_dev.max_brightness <= 0) {
+		ret = -EINVAL;
+		goto out;
+	}
+	udev->led_cdev.max_brightness = udev->user_dev.max_brightness;
+
 	ret = devm_led_classdev_register(uleds_misc.this_device,
 					 &udev->led_cdev);
 	if (ret < 0)
@@ -138,7 +143,7 @@ static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
 	struct uleds_device *udev = file->private_data;
 	ssize_t retval;
 
-	if (count == 0)
+	if (count < sizeof(udev->brightness))
 		return 0;
 
 	do {
@@ -151,9 +156,10 @@ static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
 		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
 			retval = -EAGAIN;
 		} else if (udev->new_data) {
-			retval = copy_to_user(buffer, &udev->brightness, 1);
+			retval = copy_to_user(buffer, &udev->brightness,
+					      sizeof(udev->brightness));
 			udev->new_data = false;
-			retval = 1;
+			retval = sizeof(udev->brightness);
 		}
 
 		mutex_unlock(&udev->mutex);
diff --git a/include/uapi/linux/uleds.h b/include/uapi/linux/uleds.h
index 2545b79..3788d5e 100644
--- a/include/uapi/linux/uleds.h
+++ b/include/uapi/linux/uleds.h
@@ -18,6 +18,7 @@
 
 struct uleds_user_dev {
 	char name[LEDS_MAX_NAME_SIZE];
+	int max_brightness;
 };
 
 #endif /* _UAPI__ULEDS_H_ */
diff --git a/tools/leds/uledmon.c b/tools/leds/uledmon.c
index 44d8634..163da85 100644
--- a/tools/leds/uledmon.c
+++ b/tools/leds/uledmon.c
@@ -22,7 +22,7 @@ int main(int argc, char const *argv[])
 {
 	struct uleds_user_dev uleds_dev;
 	int fd, ret;
-	unsigned char brightness;
+	int brightness;
 	struct timespec ts;
 
 	if (argc != 2) {
@@ -31,6 +31,7 @@ int main(int argc, char const *argv[])
 	}
 
 	strncpy(uleds_dev.name, argv[1], LEDS_MAX_NAME_SIZE);
+	uleds_dev.max_brightness = 100;
 
 	fd = open("/dev/uleds", O_RDWR);
 	if (fd == -1) {
@@ -46,7 +47,7 @@ int main(int argc, char const *argv[])
 	}
 
 	while (1) {
-		ret = read(fd, &brightness, 1);
+		ret = read(fd, &brightness, sizeof(brightness));
 		if (ret == -1) {
 			perror("Failed to read from /dev/uleds");
 			close(fd);
-- 
2.7.4
