From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v8 6/7] platform/x86/dell-laptop: Protect kbd_state against races
Date: Thu,  9 Feb 2017 16:44:16 +0100
Message-ID: <20170209154417.19040-7-hdegoede@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The kbd led code has multiple entry points each of which modifies the
kbd_state by reading it, modifying a copy, writing the copy and on
error setting the modified copy writing back the original state.

This is racy, so add a mutex protection the read-modify-write cycle
on each of the entry points.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
-New patch in v8 of this patch-set
---
 drivers/platform/x86/dell-laptop.c | 112 +++++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index a2913a5..70951f3 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1133,6 +1133,7 @@ static u8 kbd_previous_level;
 static u8 kbd_previous_mode_bit;
 
 static bool kbd_led_present;
+static DEFINE_MUTEX(kbd_led_mutex);
 
 /*
  * NOTE: there are three ways to set the keyboard backlight level.
@@ -1562,9 +1563,11 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		}
 	}
 
+	mutex_lock(&kbd_led_mutex);
+
 	ret = kbd_get_state(&state);
 	if (ret)
-		return ret;
+		goto out;
 
 	new_state = state;
 	new_state.timeout_value = value;
@@ -1572,9 +1575,12 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 
 	ret = kbd_set_state_safe(&new_state, &state);
 	if (ret)
-		return ret;
+		goto out;
 
-	return count;
+	ret = count;
+out:
+	mutex_unlock(&kbd_led_mutex);
+	return ret;
 }
 
 static ssize_t kbd_led_timeout_show(struct device *dev,
@@ -1634,9 +1640,11 @@ static ssize_t kbd_led_triggers_store(struct device *dev,
 	if (trigger[0] != '+' && trigger[0] != '-')
 		return -EINVAL;
 
+	mutex_lock(&kbd_led_mutex);
+
 	ret = kbd_get_state(&state);
 	if (ret)
-		return ret;
+		goto out;
 
 	if (kbd_triggers_supported)
 		triggers_enabled = kbd_is_trigger_mode_bit(state.mode_bit);
@@ -1650,18 +1658,24 @@ static ssize_t kbd_led_triggers_store(struct device *dev,
 			if (strcmp(trigger+1, kbd_led_triggers[i]) != 0)
 				continue;
 			if (trigger[0] == '+' &&
-			    triggers_enabled && (state.triggers & BIT(i)))
-				return count;
+			    triggers_enabled && (state.triggers & BIT(i))) {
+				ret = count;
+				goto out;
+			}
 			if (trigger[0] == '-' &&
-			    (!triggers_enabled || !(state.triggers & BIT(i))))
-				return count;
+			    (!triggers_enabled || !(state.triggers & BIT(i)))) {
+				ret = count;
+				goto out;
+			}
 			trigger_bit = i;
 			break;
 		}
 	}
 
-	if (trigger_bit == -1)
-		return -EINVAL;
+	if (trigger_bit == -1) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	new_state = state;
 	if (trigger[0] == '+')
@@ -1677,22 +1691,29 @@ static ssize_t kbd_led_triggers_store(struct device *dev,
 			new_state.triggers &= ~BIT(2);
 	}
 	if ((kbd_info.triggers & new_state.triggers) !=
-	    new_state.triggers)
-		return -EINVAL;
+	    new_state.triggers) {
+		ret = -EINVAL;
+		goto out;
+	}
 	if (new_state.triggers && !triggers_enabled) {
 		new_state.mode_bit = KBD_MODE_BIT_TRIGGER;
 		kbd_set_level(&new_state, kbd_previous_level);
 	} else if (new_state.triggers == 0) {
 		kbd_set_level(&new_state, 0);
 	}
-	if (!(kbd_info.modes & BIT(new_state.mode_bit)))
-		return -EINVAL;
+	if (!(kbd_info.modes & BIT(new_state.mode_bit))) {
+		ret = -EINVAL;
+		goto out;
+	}
 	ret = kbd_set_state_safe(&new_state, &state);
 	if (ret)
-		return ret;
+		goto out;
 	if (new_state.mode_bit != KBD_MODE_BIT_OFF)
 		kbd_previous_mode_bit = new_state.mode_bit;
-	return count;
+	ret = count;
+out:
+	mutex_unlock(&kbd_led_mutex);
+	return ret;
 }
 
 static ssize_t kbd_led_triggers_show(struct device *dev,
@@ -1749,12 +1770,16 @@ static ssize_t kbd_led_als_enabled_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	mutex_lock(&kbd_led_mutex);
+
 	ret = kbd_get_state(&state);
 	if (ret)
-		return ret;
+		goto out;
 
-	if (enable == kbd_is_als_mode_bit(state.mode_bit))
-		return count;
+	if (enable == kbd_is_als_mode_bit(state.mode_bit)) {
+		ret = count;
+		goto out;
+	}
 
 	new_state = state;
 
@@ -1774,15 +1799,20 @@ static ssize_t kbd_led_als_enabled_store(struct device *dev,
 			new_state.mode_bit = KBD_MODE_BIT_ON;
 		}
 	}
-	if (!(kbd_info.modes & BIT(new_state.mode_bit)))
-		return -EINVAL;
+	if (!(kbd_info.modes & BIT(new_state.mode_bit)))  {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	ret = kbd_set_state_safe(&new_state, &state);
 	if (ret)
-		return ret;
+		goto out;
 	kbd_previous_mode_bit = new_state.mode_bit;
 
-	return count;
+	ret = count;
+out:
+	mutex_unlock(&kbd_led_mutex);
+	return ret;
 }
 
 static ssize_t kbd_led_als_enabled_show(struct device *dev,
@@ -1817,18 +1847,23 @@ static ssize_t kbd_led_als_setting_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	mutex_lock(&kbd_led_mutex);
+
 	ret = kbd_get_state(&state);
 	if (ret)
-		return ret;
+		goto out;
 
 	new_state = state;
 	new_state.als_setting = setting;
 
 	ret = kbd_set_state_safe(&new_state, &state);
 	if (ret)
-		return ret;
+		goto out;
 
-	return count;
+	ret = count;
+out:
+	mutex_unlock(&kbd_led_mutex);
+	return ret;
 }
 
 static ssize_t kbd_led_als_setting_show(struct device *dev,
@@ -1913,27 +1948,32 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
 	u16 num;
 	int ret;
 
+	mutex_lock(&kbd_led_mutex);
+
 	if (kbd_get_max_level()) {
 		ret = kbd_get_state(&state);
 		if (ret)
-			return ret;
+			goto out;
 		new_state = state;
 		ret = kbd_set_level(&new_state, value);
 		if (ret)
-			return ret;
-		return kbd_set_state_safe(&new_state, &state);
-	}
-
-	if (kbd_get_valid_token_counts()) {
+			goto out;
+		ret = kbd_set_state_safe(&new_state, &state);
+	} else if (kbd_get_valid_token_counts()) {
 		for (num = kbd_token_bits; num != 0 && value > 0; --value)
 			num &= num - 1; /* clear the first bit set */
 		if (num == 0)
-			return 0;
-		return kbd_set_token_bit(ffs(num) - 1);
+			ret = 0;
+		else
+			ret = kbd_set_token_bit(ffs(num) - 1);
+	} else {
+		pr_warn("Keyboard brightness level control not supported\n");
+		ret = -ENXIO;
 	}
 
-	pr_warn("Keyboard brightness level control not supported\n");
-	return -ENXIO;
+out:
+	mutex_unlock(&kbd_led_mutex);
+	return ret;
 }
 
 static struct led_classdev kbd_led = {
-- 
2.9.3
