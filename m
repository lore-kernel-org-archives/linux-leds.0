From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 66/95] leds: pwm: silently error out on EPROBE_DEFER
Date: Tue,  7 May 2019 01:37:55 -0400
Message-ID: <20190507053826.31622-66-sashal@kernel.org>
References: <20190507053826.31622-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190507053826.31622-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Sasha Levin <alexander.levin@microsoft.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 9aec30371fb095a0c9415f3f0146ae269c3713d8 ]

When probing, if we fail to get the pwm due to probe deferal, we shouldn't
print an error message. Just be silent in this case.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 drivers/leds/leds-pwm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 8d456dc6c5bf..83f9bbe57e02 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -101,8 +101,9 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		led_data->pwm = devm_pwm_get(dev, led->name);
 	if (IS_ERR(led_data->pwm)) {
 		ret = PTR_ERR(led_data->pwm);
-		dev_err(dev, "unable to request PWM for %s: %d\n",
-			led->name, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "unable to request PWM for %s: %d\n",
+				led->name, ret);
 		return ret;
 	}
 
-- 
2.20.1
