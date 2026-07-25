Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E253783AF
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967246; cv=none; b=BO7FXZzFSKvuhBleOaT/W7k5VYtM2JjXEbNWnbtwMhGwzN74ZpJck0CEB9LvWxLVVXQG69vTlotTcOl91DjN0GXqIPAxr5owVmRubvjUweKhOS8Ub3Hl/Gh/ZNEa48Jw7h/8VcP1rZ5911dfkE8jP+j/qKGEY0RLxBYavoEegEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967246; c=relaxed/simple;
	bh=4O/79lYjfH36rUJeWJeqLaWNqBfqFwVt8K2YfiTpeck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o43MHe0zw83TVPpb7VEIXONbZSOH7TuD9vO6A+UbU6iQh0KyKl7YIdltAtjwAx5Y9JNXpTWRmv7rUTndfOjOxegOOt9HmByWcm53UXATzMOSa3ho8Pg+vITgJJdZkgPazQNKDNYy3i2T0PGCRZzpYvOeqSFWVy+/bN9GRu/6dIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJ9oF/8e; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJ9oF/8e"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso777478a91.1
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967245; x=1785572045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+C/yqr7T4KyDtcTP0jsx9I4AQREpUgRCzIWZwQtd1a8=;
        b=VJ9oF/8eK/d9+8D+Vwko1+1viqNXgi7OM5ELDpasZ2C1+saKCJ0WmIL/rqHkUpZgFu
         1+TEX/z0ghHEvb2TGk2AH4C+tDt/ssD+ULtfNruOJJQmNAQ/8jugiOMr3+IUKBv6Sh6q
         NMILKzTwbel6Nyb6offCQghSH4Z7qWCfggu2ElOkD4rrrgkpDl3mjUsFvnhurrMv8Scj
         JH6DNqG1oLsF6F0UvqqDexMs/0prVzEB1iuDTjMA/DeYvbcVhLYjPiiU2LW3VzWUoY6/
         xbq65gq+oP+zgrCm9rMlieGrUgOlQv+1R/Yvz9l34YRuC8seZK3KHmq3DwQzhzMYbTHJ
         M8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967245; x=1785572045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C/yqr7T4KyDtcTP0jsx9I4AQREpUgRCzIWZwQtd1a8=;
        b=poQL2MllajFZ72XXTmfhErGfw2eXcjbyBJCpLk7hJeyNBNd4qoPzw7uQL6EEtK1/Y4
         RmTnsr0vlcH3RPNjFvZSGkKHda4Zr4+Jg8j9I5l52cfe6p+ljyza/kOthdkVl+f/IAKp
         mgU7Qy40a6rcHObiaODJnad7Jzl5N/DaYoOW0S9Fg4acjE0BHy0mu7IMrGAwqLIMap8U
         +9d2OtaYVA/5RktqTkSBhjD0AtaKr7bY2gHwzZ5DoXPMeqyMrvB+IRJVmaL2D2H2iWPX
         8YY1uOcE7QZpq48K6eS9HkVQivn1evQVuCGLnrarHlSwnxkAvHMSCfJFfFDWbLZ9BsRG
         2irQ==
X-Forwarded-Encrypted: i=1; AHgh+RonhQb2uEgpXdFaQfT0uFJy+GLuT9q/nch93uurVKoM26nH+ORyvhOqXgYYKVcK40Ffdov3flSUSIme@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZxFv/QOizLuqchiYojSbzRsi2RSOVhiLFUfqzZNMYCooYGu9
	RJ+pRVAAbRBZAqq+noSa/ewg5tP5JZN86OpIoD3GFVWxOwRSVhTFwicl
X-Gm-Gg: AR+sD11WRwzTy+bTzA7eosMi8VUH5xw1r8LIMJLupiwiiH9qc09aAyG3r16++xlkL+Z
	tWqVaY5FUys4Zpa1GTDwrzwZ/vZ7PrA3JlvF/yjmV5Mz2JqwQxg8XOOSyf+blZud6ZzxNQmgoPE
	6OVl9ECrDThL1A38cS73O/mqgsITarwWGed9nItAHVJTJsEEq0xn7C2u09EL24IMTzkJsdc23EE
	sSlBWFu8SVs70EEcdTgCCNRnjbCRwQq2MSeQZjF7oWKn/SWVf4HEiZwnjUnLJP2QcTCqMJwR417
	/hKKooKZWDgvucPA9iQNRlkOqjYzO3OjAinTxkIlFOluiS3/0BBECFgWYujqIkscFFzjRblsXjx
	jMBM09EnukDQIgqiB3Vg3tN/sFeNg5uewf85Y43SvEOV9sQT484Ir/9CoyaLh36xXf4vhSUDr+8
	UZQFag9TKH4KgNE0G0201afzRzU5vjM2s=
X-Received: by 2002:a17:90b:4d0c:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-38f293cd1dbmr1727802a91.12.1784967244664;
        Sat, 25 Jul 2026 01:14:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:79f:1f48:d3f7:8b5a:7633:b67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm56487293c88.2.2026.07.25.01.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:14:04 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v3 2/4] leds: lp8788: Convert to dev_err_probe()
Date: Sat, 25 Jul 2026 13:43:47 +0530
Message-Id: <20260725081349.8556-2-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260725081349.8556-1-arun07172003@gmail.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded dev_err() + return patterns with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-lp8788.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 9b9525ccc..259ac50e8 100644
--- a/drivers/leds/leds-lp8788.c
+++ b/drivers/leds/leds-lp8788.c
@@ -143,16 +143,12 @@ static int lp8788_led_probe(struct platform_device *pdev)
 	mutex_init(&led->lock);
 
 	ret = lp8788_led_init_device(led, led_pdata);
-	if (ret) {
-		dev_err(dev, "led init device err: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "led init device err\n");
 
 	ret = devm_led_classdev_register(dev, &led->led_dev);
-	if (ret) {
-		dev_err(dev, "led register err: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "led register err\n");
 
 	return 0;
 }
-- 
2.39.5

