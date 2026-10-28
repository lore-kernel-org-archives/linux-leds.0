Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209432;
	b=KFEFnaJ4PvUyeQEPLtzWUMJgqlLwcqTSh9VOjzip5PbFz16CSkz4HoecGMNYR8t8pZoM
	 TDAgNiqvRLkNIJmrRChNpKc2xe+lqhcJIlmuqcmNPTOXYumClNVTbAkc03yN/vHn6E5KI
	 hI35S3gweEvWGLg0E3Dv5kmI8ab7P6V75ExTZSKwlAEpfhZ7SitqM3x1CnOYEp7tqGufU
	 +0gHTYDW0d87A7Ai5pA/Eo8aEGvS/7v1b1y7xwhOp4f6ygo0eE3O6A4SmQPagImuFzETF
	 aguuneOvUhKyFjn3kZw93VxTl4liadFaH4CseNODJlH4FglR29LcW8LovzBmTPQuJ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gnYk9mfIVN/zPIOrtWIc8Ged1/pnLoxgeSZf0zwa4jA=;
	b=mwS1vE6SwSuuu6ucJE7vgQiIbj6PdyWDTYsPvhijpPgmfG5418Er29gmXKgJr5enwUdA
	 uLa6+zgnOOHWTwm3wUc6uce4N2jF8vWs+ZJy1xHV4mWpAisLghqzREyKR0XfmuX9+6o+8
	 1IaVyok9VevgTkkLQDq6TnqtkW7LQ4pBbkij5Pql/idmt93kMNSbOOgNdNztiv1O1ygHl
	 2c/sZ+UOb8aROESQVjpQzcWQ/eeP4BHD86HrAm/5IU590ae1Wwz9awHBBsEsjXPctyH8c
	 hu39XgiYntOi68fQMLWYEl8yB8ybS0cUNA/iXo1VAc4W0wIzJEbgZ//5Oh/O6q78jyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWi2t7TO;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F4606A31C
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 17:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D7F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWi2t7TO
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-54cd7de2d42so811411b6e.0
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209431; x=1793814231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnYk9mfIVN/zPIOrtWIc8Ged1/pnLoxgeSZf0zwa4jA=;
        b=pWi2t7TOd44Eg+6imclUJU9GB+HVHns8S9UEPU7tH8nxTHM5qiwUk3Tw/W7VA602oe
         qWUQ87i9kY68xNZH44BMDGWZmsx4srbezbnGe8JzeCP4hAXHazvzwJdcsI9m5G04Kubz
         TSzKrztvYmmwuGAXO7wNOa+F6tZH6DT/OmZ7bmXlRxTYW2guMAFGTHA2L9PNhXg0cA4O
         ZfaGgv/15EDQwME+L5a+K6YNsf4YQ8xyTrvDZpU7IAryijKF80j4b3S0ycI8GO+R19FT
         yfnfZ5X0/e6ZpjfMRKHUVY+H3KU5Md8Bd4vdWdHw4awTVQQIOy8mokpE1yvUpHhm6L3p
         q3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209431; x=1793814231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnYk9mfIVN/zPIOrtWIc8Ged1/pnLoxgeSZf0zwa4jA=;
        b=ALS0XINCnGdWr9x02re+1zW0A1szNoSfsX69Btm74HNlsKUqYXy6B8UJNKJ5h5PeXD
         bA46Ag2K8gpLzrocidnph323LiauSc6Jj9gjAAnna87T7QJm8faHsRJWQY7UMy61qZ8E
         kqM8LCB9HyXpujpeVVi2aPtLuABBX478/os+5z/ob9Sr3Bmv4jMuM8or8s+SQDHOht1I
         yVNEoFl7GQ+0fTlR0sxG1L5hCQfAZ+CCFdFFv0URmRKbdnnpDCleSxIVjIctVg1pCUp1
         KInDl9uqf9ig+xvL3zHVmMPoSON2Bug49LXvVLGPd2S6m0jxDkrwHwQnJ0DBXRiW0U28
         qBCA==
X-Forwarded-Encrypted: i=1; AKwUvByuWo3qJf9JJ6FBaRLVvfm4TbpqjDYAbScxdkZHmgRSLC2E8K6Ac3gS91owL6CSa3Rv5f21hJt0pzoE@vger.kernel.org
X-Gm-Message-State: AFq9FYJleyzdBMna267jZvz0PiQwNAKxnvaVUgc2tSiFU/9QJvSQQu2K
	cppsVZfZ1ow4NVcCHJffCV05ppZTozQOvEJjNPVkR68UGum1TiQWtDvBryBuOYKU
X-Gm-Gg: AYBFou2qNYTnIrPnDK78SdI4QCR2JgG9gBrg5FpFtJwMvOugDPZrn/4WGMtWsY/hJza
	Fbbcht9vTWVnw0QJ4dHBUXMpK+BkF0Ug//26GoWl2MU6r48He1oVBE85BSwOPzFPywBlV11c3Hy
	Em/cxEBbfhjqhnf45zMrIaaOexqZiNNA5tVLg5Bzr4h3sbE2TYjS2Du44wpFCpIiOlcBa9Z3OVJ
	x5Z87DPUB9UdJtasvT1uwLWegHo6UBjBGMuYem/iQ4NTc79auXC8AMvIrlmcm2dKWZTpiUb93U5
	n+MYjQDyLcDLw20gAMNHaojyejtYzwpKT/3AjvDfMsLy3Hp2ZpS5yazSyBFHvwz28AGB6P5Z4IG
	1E7m6FSlbtxaCOqepJZgbhNI8XV9sUJMbp7LSkx+cbPV5j1q7mQTJ8S2FckvaTtIvPtE2Pr1lVL
	CfgemlyVBfiOGU6V/k4yLTgOBSJDBj3L7ByPw/WvUKr0vJfMeViEWC5btZPeh0XdtLKrpSLg66G
	HZHkQqGfGZ+b/ZZlp5LKX205B5zZpJg73P2jOV2qB8gww7LVSpeY3ikjpqZ4S+I8phXVNggdb0Y
	/oGdCup7/t0NN2iBnNub6rkojDSxinFweg+ZHUooa3cjnzY9PW1kg4/LWBpGk+ts4xRWzvU=
X-Received: by 2002:a05:6808:1207:b0:4fc:5e91:5377 with SMTP id 5614622812f47-56384c86a46mr2096223b6e.59.1793209431161;
        Wed, 28 Oct 2026 10:43:51 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm1612114b6e.8.2026.10.28.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:43:49 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v3 0/2] leds: tca6507: Fix use-after-free on unbind and turn the LEDs off
Date: Wed, 28 Oct 2026 12:43:46 -0500
Message-ID: <20261028174348.64014-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Patch 1 is v2 unchanged apart from the rebase. It sets the work up with
devm_work_autocancel() so devres cancels it after the LEDs are gone.

Sashiko pointed out that the "LED off" write queued by unregistering the
LEDs then gets cancelled, so an LED that was on may stay on after unbind.
That was already the case before 1b5c2fa7081c. Patch 2 fixes it by
flushing the work instead of cancelling it. It is not marked for stable.

Changes in v3:
- Add patch 2 (Lee)
- Rebase on for-leds-next
- Link to v2: https://lore.kernel.org/all/20261015144033.56519-1-danishkhateeb03@gmail.com/

Tested in QEMU on a next-20260930 KASAN kernel, with the driver built as
a module and a test-only module that adds a fake I2C adapter, logs the
register writes and adds a software node for a TCA6507 with two LEDs.
With both LEDs on, each of 20 unbinds was checked for a final write
clearing both LEDs: with patch 1 alone it was missing in 7 of 20, with
patch 2 in none. There were no KASAN reports with either, over 20
bind/unbind cycles and an unload. A W=1 build with GPIOLIB is clean.

An LLM was used to help with this series.

Danish Khateeb (2):
  leds: tca6507: Fix use-after-free on unbind
  leds: tca6507: Turn the LEDs off on unbind

 drivers/leds/leds-tca6507.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)


base-commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf
-- 
2.56.0

