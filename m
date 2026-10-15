Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827C5226AA
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068629; cv=none; b=bwbMNUyQSWpf9zrrdDwvF8eFWrM1bBocZm/won9aI4Q/1ZTTYejZ68cVCWBx+A+4Vf1twP5Yq3qAR1BFKujikjUzZtscq1lwEoiG+WIrD8lCbYRIlh9IpzV/4vi6K7SEkHg9pXL93RHcMH07EJ9weaE2p2CHp9RPm6PqTFV+8BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068629; c=relaxed/simple;
	bh=vLkp7CnrKfl1dEHGT8RtciddFshZjtcg5UAArZDgK7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BipuR/rnzWCLBEFzNa+VWkt0vHiq7gSFFNG9uOmBnv39CqjwTl7gwEsPoseJPg3BFV3nejOQXU2y4ATelP3EbSaLFLC0EuwGEgyqSsJMiB8Rs0o5SOuQi3LMZi7KoYfmoUI1KexwCoCejc5Kl4ZCanc1d4W6OtlSHFfBnA0ouTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=gMEPEmug; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="gMEPEmug"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-16ad92569b5so4954238c88.1
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1792068626; x=1792673426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=keTa3jZbkpCAH7JHtH8sV3LYGMY6X3FohOSa8WF+qeg=;
        b=gMEPEmugERMbdQO6g1m5+hsEBaIKqm37RuS05QVdiY/tw6TF/1o3++dzMCiRiXjCVQ
         yqMZwkbd+6a23Orvnyu4RWjW466e8qNT14SGpaunKnCWJntYkbExCZlBYP0ILuIwbBQ/
         d/wlDaz4jEG1wNZ5cYzPR9hKL9nX4OOJQCC1UZK4tfjYmko5GHI2hqciRTRkZsoHE1Mc
         VIgpmON5A8Z0zJk56qKb0cGWX8laQwisuSPkrrqTJya10cTD5gE5078oTrtKH3cQNXjA
         pNT9LC+DJBHsGtbfMPXEAlfefDiX8f7u0lEiIhKNo+CilQSSliES2+CsZH1ux6rUYx3Y
         RQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068626; x=1792673426;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=keTa3jZbkpCAH7JHtH8sV3LYGMY6X3FohOSa8WF+qeg=;
        b=MQm15OKQRxVljtjPZiIJatarX5Hwg2u4VR3Azqp49UEQ7ENr6F0t7/5s6yQFArKzOZ
         jnLamMwMeR+GP4Cm8fnAfd6HNQ2DC/jquCNsjiaVxdP1nhTbfaPv9WDhZEvneY6J0RjQ
         3oJYOZzzEOPNBDeOoF+YBvDxUo1lr76DxYjb43hp6pjSJV3a5uSQcOWtIiK7Ri6vrQVQ
         QSWhqn6iqIRlF+ytYDRc+eBUDKGKRRrh5zeZQnjfECzXHlw28UAHIgeyHswou7C243vy
         psTTiP+xqCrZrOHyQ+6Z42l9vR2Qk8mpKYWTYVd71L5mHZc3gC46WZdUeh7eqk0ucoVO
         k0Rw==
X-Gm-Message-State: AFq9FYIL98whYBCr6PBNrV6bT0dKwgqRh8AibyUpRMxzkYAj/txZPRk4
	zXQyIFaoLNGulgrhTXyM6yWL5MJJYTTv9js4RQ2aW5lKf4pSCBEI7/ErHdchS5Tp5NY=
X-Gm-Gg: AYBFou2SojKnOOdgtwXI5SpGlipHBFZzknczzpKASmZY8vTvPeFj1rjTcA2kPHsD7TT
	OQB4ajgrNOpE2nLKkr//NciumAsUQya9PUkCeOVUzfJ3zdQZyxPFCe/yR0H1y5vQ9hS51XEqu4W
	2Sjq3lQtFr5WUMAfnLc4oSdgXLGiNyfy3yay1OL6FAOphA6VMGjjEmRe2MYTarYFAwHvbU527dl
	dqmEo4FoHeZjRc4Yn+bkQkRC48QXDqW0OyKVwFnJihJK4ibQq3NIVBwDC+9npAjcz8MjZL+eVpC
	Rbj/C3G38CBjthrn3JM8iUwmUBgTSwrJdLf1AbwIGgefZkTiRs4/ZC4b0+cFP24Qsse7+/MYTL0
	VWyCOuSAKpoGc5YO2fCpTaDXJwtlhV0EyguBu2NmsAhNzWVWMOIXHKfXrtJNLACK1iCN9i3cwsD
	FRuMnJVSO8/LoS4hUjDHGFjAQKptG2CuQs26TQKjjVMAxwcRi7QUK6xXea1blwWDWoGWJOxtmuq
	pPqesFYHPKIqeZE
X-Received: by 2002:a05:7022:5f04:b0:17d:961d:7db0 with SMTP id a92af1059eb24-17d961d7e11mr5695442c88.28.1792068625670;
        Thu, 15 Oct 2026 05:50:25 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:efe0:7af6:c627:5f7f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm54602983c88.19.2026.10.15.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:50:25 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 15 Oct 2026 13:50:18 +0100
Subject: [PATCH] leds: nic78bx: Use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-acpi-leds-v1-1-81ac99b105e7@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpFQBRG4VfRvjY1M2FO51XkgvFj64RmIyXvb
 g6XX63WSYLAEPomJwXsLDxPESZNyA/11ENxG01W28Jok6vaL6x+aEVp5zqXI/tYOIr9EtDx8bz
 K6rVszQi//gd0XTeQI5kCbQAAAA==
X-Change-ID: 20261015-acpi-leds-077f75e482e7
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792068623; l=2393;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=vLkp7CnrKfl1dEHGT8RtciddFshZjtcg5UAArZDgK7s=;
 b=VpHQcFjgGl/s94WgtEQN/3l7VvDhkmuP3BgqZ+1g31WYFr8ZJ2/Glqm8dWYh0zImRyV1hrG39
 5JyH37lZrZHDO3hn7jdeE2S7N2xf5cYCvhUoHn+p6K5/KIupDbHPSNs
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply to this tree)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/leds/leds-nic78bx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index 5e3098e1e1ad..d0f80aa3cf47 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -188,7 +188,7 @@ static int nic78bx_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id led_device_ids[] = {
-	{ "NIC78B3" },
+	{ .id = "NIC78B3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, led_device_ids);

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261015-acpi-leds-077f75e482e7

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

