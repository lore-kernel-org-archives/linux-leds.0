From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 05/34] leds: leds-tca6507: simplify getting the adapter of a client
Date: Sat,  8 Jun 2019 12:55:44 +0200
Message-ID: <20190608105619.593-6-wsa+renesas@sang-engineering.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

We have a dedicated pointer for that, so use it. Much easier to read and
less computation involved.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please apply to your subsystem tree.

 drivers/leds/leds-tca6507.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index c59035e157d1..58be20cae183 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -758,7 +758,7 @@ static int tca6507_probe(struct i2c_client *client,
 	int err;
 	int i = 0;
 
-	adapter = to_i2c_adapter(client->dev.parent);
+	adapter = client->adapter;
 	pdata = dev_get_platdata(&client->dev);
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
-- 
2.19.1
