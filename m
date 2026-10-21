Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586066;
	b=o5CwyLVmZ1yajjRDhBmn6AorZG2j5Al7dO2kXj37lB0vd573alSpL5c9ZgsV0w+1HWYd
	 IJENck+r8Q+4/QkoCrYODcesvXExG2zWblgvznlxQaMK8ld9CUl5NTFOpIXXOZyMLU7hw
	 R52MMiltql4ibtI9YOGe9wQ0AmkI5jYpc/UEWxNj7YDqmVw4q7eAQuApQeqQSFxoy1xuk
	 yYRsht6NlDpFZAulmy7cMmyVViwWoSp6u5oXETB4vkbbiFeCrEqkUuRuVixUPp6e9AACh
	 hx7IOuxFckYejFMgxwV1tJqDnB8HBifYS5+HJqpPZV1eJQnlgBOxsG0TwStDyfSBfTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586066;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wxP/k2b/I3HcvcyWM2Qs3uvGHPbuhCRx3ICmvwkMuvE=;
	b=h+7bkxXLKj//Np7zhI1/p25olypxOKIMvZbZeqK0wY5lD48PswcirIAcKsmXyIQkeoM0
	 4FheC/jh0TiFQkdzR+fEKKGCOg8TOxloMGfoFvpw5BE9oOTodk+TkJJ7ECw5uf9Oa7Ayx
	 AS6LP2vWC5aWXSJC8n5DkD6REyzpMfgQ4pa08zaZhFKYG8P6tgHmJEJbTPHELadYGR9pK
	 B5XDpLmHbhqImVDcBPhEyC3muqaBnQVBgz0yUmDwqPP+TbBZYH72ky0rhimajln1xGlqp
	 zRwUsOEDjplDEKEnpLlz8kWayfJbyGf8GOo4jnSD0FJWuhiQW+xK2Gpx78TfOqSs5bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAiUkZD0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE11606A31B;
	Wed, 21 Oct 2026 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAiUkZD0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18ED1F000C4;
	Wed, 21 Oct 2026 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792586065;
	bh=wxP/k2b/I3HcvcyWM2Qs3uvGHPbuhCRx3ICmvwkMuvE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CAiUkZD0TBdSS+/cZ84O85/x20Anb2IKzmCeTLmAyjwomT/Jgf5BuBFU8jCF4cyas
	 wsbH3OZY8PNGOo70YuRcfCVDVpalWDhWugdlIag0HoNUgcIZDJK19t5sEJA7QGMoF1
	 pBZLSocJbC6Vy0yy8IdWlHM91Aazr4f4afxZrNd3Z2Mp3LMBxhq5SPhXzw7mcizgPn
	 wkf7S91kIjuGaGW7/NvvRKa+G027DnGkmwo8sPcCq0aMakvgERDIQnjD+nJkY4RfJC
	 qOg0M9CPq6OVNFII926B8Xm7TNyOPhNN9EhMw1imx4GhLu5KvCgpXb2ilXvUTkIXgR
	 OYPT39mw2r9Ow==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Dan Murphy <dmurphy@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/21] leds: lm3532: Use dev_err_probe() when lm3532_parse_node() fails
Date: Wed, 21 Oct 2026 12:32:11 +0000
Message-ID: <20261021123406.3163547-3-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021123406.3163547-1-lee@kernel.org>
References: <20261021123406.3163547-1-lee@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that lm3532_parse_node() propagates errors from devm_regulator_get(),
it can return -EPROBE_DEFER when the supply regulator has not probed yet.

Replace the unconditional dev_err() in lm3532_probe() with
dev_err_probe() so that probe deferral does not log a false-positive
error message.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/leds-lm3532.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 7f849a166a92..cfad4e791e4b 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -707,12 +707,10 @@ static int lm3532_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, drvdata);
 
 	ret = lm3532_parse_node(drvdata);
-	if (ret) {
-		dev_err(&client->dev, "Failed to parse node\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to parse node\n");
 
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id of_lm3532_leds_match[] = {
-- 
2.56.0.218.g1ec904b173-goog

