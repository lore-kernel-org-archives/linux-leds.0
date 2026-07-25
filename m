Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6766245039
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785001923; cv=none; b=vCRMyNyk6B6IZgH1D3SFtQgP13R0QfcGPmbxGsgYeLji5VknUi3iUvbuUy7W9NLPk+O2m7Yu5mh1Anw97qAzgvvW1v9JdE72oVH8PCXqSbflCFHEs6Lujz9hozHzFnRzHzoWLM8HVNXwT76jRJ6mDio81teb/2KvtNcOkLyIXlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785001923; c=relaxed/simple;
	bh=dmSLaF3JmSG03N473oGR1xv44ugjuUkoBFljlg4wI2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IHiG72bxyUMCcQqSKVZKBM44TbFGaK6T28lyLwhz2cX+9XsBULW9DpJWwzcsEPQMNzXIxAf6oDSQSqRmlI8CpWhhjVGEyHJnxcOxplB7nR3/J9xolVzyJgJO96YpJvSPC7AOWC8xTZYZcast/5jPaS7LHG7+KOuh2YRT/twGgok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyJZn+uB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyJZn+uB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1110665a91.3
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785001922; x=1785606722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTyixV4W5r/eynqu0K/4hqgUBWxGM5A/HW+QpMLLe5U=;
        b=pyJZn+uBWe7k/32lvG/lMlriprT/pIoUlpBqYWWD/vQUAq+Ct7BG4PWOSKhJY1am/B
         CtJROx4OpDEY4ArWjOuanEX7Bfx3RbpjGEczS0WvxXIZxz0mbbSl2FyOWteRTjukOk15
         eC54kkxGq+kBP1qVcOveni97E0RaWlvfl1S0v5biwsCCVLGYmlCGCnWC2eTpdYECrjS3
         wEMXgvd07nHZtfk9WRydqb+AolGamuBxvhROyZqkU1yfllJjgEi1WFU+E07/9Gg3Vgyb
         OtN1fL70I8guESiK3Pr2kp216sFxhQL3Obn5lqLPkay++dOaT7kVQBk2J8srlYbtStAI
         GFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785001922; x=1785606722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QTyixV4W5r/eynqu0K/4hqgUBWxGM5A/HW+QpMLLe5U=;
        b=IOQ6fiNvAn94uooEncRUvbM4D2a4qWwyKhhujZvDG3oz52vaDnq0QKDiVBaGcIKA35
         m4xWE1JnS0DvXhIn6xhSDi9tVjWrjulaT3yHidh9qdgyJL6F13Ck0NnbJxkEK0sR1KDY
         8oQdwEWZYKVNoq+sJuHD8kGRoQMk4UUOJjlVqAs3Md/H1WgB3DSSbeppzwkO75Hm81mY
         HTr9tvZTnTKukQZXg64le+FgacB7k/0P5Z/r6K00xBNztRN6kJM0U0ge6Aty84vV107a
         frTc3mmBgj3JHdL+n7E5/GlRwuJg8z0guN4OKKXMX+iaP0riHin7BKJOwqlE79edIplZ
         45ZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpg+vLBjfdJMnOK46zzwhRk2lvECOKqfphY4cAZf+OGCAzKhSe1klxQFXDvz91Qe5aNXt5y9GcxraX8@vger.kernel.org
X-Gm-Message-State: AOJu0YyHT0AXRg2OL1zL/klwhQLB9MUvZgM4kP0P5cz1H4aAZLLEYBHO
	O0ZX7omR4gVyQ6dnoXtX1082ygcd47jLRg8NqufPTN5OzBakiG5Bjs9u
X-Gm-Gg: AR+sD12Z/RqS2Mj1Gjs6AaoIw6QX4vSIMnQ/uK9OWZtb6BT+x/uWNI1QiKVZ4z/PGkX
	KpkFTZvI7u4hmeB0Ht1tv7XLQqxiTJ7PdeFIn4C0IzZ28LLrZf4ZIBxKLgE4Sqbda//1SOkobgl
	w1JcQFzy01Jug7glzMDHj16EZyoD0Don38qSa69F5jM8IMoAYmpmYPgm7JY+2SJNft9Nygoa8MJ
	QKeysG39EVBfzaHv1YniotVQnJRHMSeu9k6WwHVMr0RmkqSIhvnzB5pOEeqzkfJSC/zDLi99Lqf
	pH6sTBFAIOq/+zkoFYSM46S4enf2TYsgWxwZ4IJ2GZpUzISW7Avrdr5q3yfpFGUNtgI9qztPlaS
	9yp7oHWMsrZMTrohCJvAr6oUTHG9FDw2gHZn/VPF36Y5ts5zTTes2SdnzjAQjVYjIvsDC1CBt/z
	+v6xRdsD6jlZyKK0UHTdk4
X-Received: by 2002:a17:90b:3811:b0:385:d033:d9f1 with SMTP id 98e67ed59e1d1-38f2961363cmr3133372a91.28.1785001921667;
        Sat, 25 Jul 2026 10:52:01 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:79f:1f48:d3f7:8b5a:7633:b67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2d1d0d1esm15485573c88.0.2026.07.25.10.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:52:01 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH 1/2] leds: menf21bmc: Use brightness_set_blocking instead of brightness_set
Date: Sat, 25 Jul 2026 23:21:45 +0530
Message-Id: <20260725175145.31984-1-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260725081938.422B11F000E9@smtp.kernel.org>
References: <20260725081938.422B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

menf21bmc_led_set() takes a mutex and performs an I2C transaction, both
of which can sleep. It was assigned to the non-blocking brightness_set
callback, which the LED core may invoke from atomic context (e.g. via
the timer or heartbeat triggers), risking a scheduling-while-atomic bug.

Switch to brightness_set_blocking, which the LED core dispatches from
a workqueue in safe, sleepable context. This also allows propagating
I2C failures via the function's return value instead of silently
discarding them.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-menf21bmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index a7e4db487..6b09e433a 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -49,7 +49,7 @@ static struct menf21bmc_led leds[] = {
 
 static DEFINE_MUTEX(led_lock);
 
-static void
+static int
 menf21bmc_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 {
 	int led_val;
@@ -67,10 +67,11 @@ menf21bmc_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	else
 		led_val |= led->led_bit;
 
-	i2c_smbus_write_byte_data(led->i2c_client,
+	led_val = i2c_smbus_write_byte_data(led->i2c_client,
 				  BMC_CMD_LED_GET_SET, led_val);
 err_out:
 	mutex_unlock(&led_lock);
+	return led_val;
 }
 
 static int menf21bmc_led_probe(struct platform_device *pdev)
@@ -81,7 +82,7 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(leds); i++) {
 		leds[i].cdev.name = leds[i].name;
-		leds[i].cdev.brightness_set = menf21bmc_led_set;
+		leds[i].cdev.brightness_set_blocking = menf21bmc_led_set;
 		leds[i].i2c_client = i2c_client;
 		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
 		if (ret < 0)
-- 
2.39.5

