Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820643;
	b=TgB0v1L5YJF0zTtJdAJ3E9/MQfdF602b2XQrljJ1mmoqlapVM/BGwLPmCUZqTNhH3hLb
	 oV0uW+/28dKQ9xfbXZEu60d8AHaXmNtkXzCwoGkFunHpsL6nvQAMVnVW8V3WOxgKJb0Bm
	 TVixGmaOCQFvXMo34/b08sfInQ6L9tIT+jP2RFAUvtswDy79RiAfgwsQB6UmViEsL6Q0X
	 4bExDLNJ5EJIGnp5f3GXwU0B6CLUgWD8z3PF+1x1tQa1hd7vQslpDqXStBdXBUl7wR/Si
	 ZXzJRvWINADkfBjXh8TeN1Z0i5jEV6H8PmwEQi19KMqRHAKF3A9jCEzJW71H45tuh5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3at1T5Y3NkxHZArmAf/Wyx+q3DAsNgKKHj/Uc4gaVrA=;
	b=1KJgKn2WUmI+LVbNTwtESdPlJpzDSlWfdCqCrowJE8ziWVVEFYzH1+37Q9IUBLh8Iuk4
	 DZQeVOsiy9d6fIuVI0p57pwU3sTsxQ3L0J4cCI0OCuItUgz/NsF2nKLVqAZ+8tH1g4rKp
	 q11uavWxVQO5F6orpXhaJ9D7F2G/zlWM5/5gIF13DoVIBsIrUnQ7wV3M6ThFsU2Hyvc7g
	 SMsqlOOkUmIHy3IOaEpCoO9eHPwhu3OiOAhJ4uuHqjh5V6SvET4YnYom2lnfXb+ZOiI/+
	 ptdWnwpNFnb/w05dB5gTPL+WabKvXHka9cCaScHhnMdBRFPXYAxXldcfZBYvK7kCaOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5TQ7dJv;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC86076CF3
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFC86076CF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5TQ7dJv
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-846566246e8so1037537a34.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 11:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820641; x=1794425441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3at1T5Y3NkxHZArmAf/Wyx+q3DAsNgKKHj/Uc4gaVrA=;
        b=a5TQ7dJv2Q8yNW9kFRS0c6hHEyDGSH0UpHFfuS115vtOJ6fLBlOX4RhN54HWkAGDlI
         N9PbT6hfdGZoy77XMwJNDQQdOGEP4XPu2lDttzbHwVmtKnZBfEAa8O/7nNRMx85uyAJM
         LK0rrhtIf8701DxXoQH6hXxrr8WWRIqTbxkc8xcYkf0kcXu90tj8fQ+QWFUmMzsTikwr
         W+Y674kZHB/kEpXccuP0JS80f4jZhEVk3pPbDQm/wTvybAxLs0QLYUkn5ogSW3jH9/ht
         /AvkQ2oKeeJhmku/wJ5xcll2/IsRRIL5hyEBtJvUQ6+JoUVUyh4wt7DlXx0eEEvBtfz0
         Rzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820641; x=1794425441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3at1T5Y3NkxHZArmAf/Wyx+q3DAsNgKKHj/Uc4gaVrA=;
        b=sHvzPMRdFZYDUrdS60Fj5ToPFSqBYsWoO+xxWlJd0gkFhlcxk9Trr3zklWd3ogsRYo
         q+rUa3W1z04eLw5FneEmCswToM1ISfQ3I5U3XpFWYGv29oaahF7sm2d0Y15r61LkEmes
         SRAnmUhLmEdgmfztfMS8pM4iUetZZnrCeztUItzeCDoj6Dq/3IwSjdzhHAHquU/W8q7r
         GJ9DZ65Tm2sOPxYVfEwDCeE2APw5t5WcMf6RhXpPwUc6sy8KNAPBj0wBIvgbd0FwFIas
         +074PeADgPOq0I68BBoUQaO6kgOCfYeFAeU4kds2FcobDaRi4XwJMmg6SK6jOZ5rju5E
         O3AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEQhfEtcK4vVCoUzZrkobZ2HTKvpZAUNu7gIcOWjAWJKfeS4Q8FsI59XAqcguRb2dyFvmEcM5fGw4q@vger.kernel.org
X-Gm-Message-State: APuU4Z9N6GEOUUsFBOUxpupCC/jTNwHTKNZge/+2VYQZRag8L1mFWo4d
	pLKxanAu86a4p+RhihYM2gq+vhoK6GlxcdSEjy6NKfrK2a+oJIs8dqVF5Z3vKiMx
X-Gm-Gg: AYBFou2mql2nJCHAZIoW1hjRbwMp5ERDKIPPwkFcxH3+0IIJDBlgjNSymLy5hlPssq9
	IeryELKzW6uIf7KMgcDt7t+q8qKT4ZmiqKaQM/SWA3nkNVBSaSrrjmhQeqWERLGEmLo0/Cv8dsP
	bnMo2wur7g9H2N4s+C/c1gshJ8HYeuI5I8Ower2X7iEgvvjwHgXi/hFien1fc3BYWxJIbyXNvPh
	kdW5MkdubrsIYWrLN5ThvdT4bd9UucFO6/tY0ZO2ZaKdd5oAm4UrLynolOOu8oaNMXF4UnRwRyX
	42MN8uNiYdZr9SvQofQPjZGCMGZzBaoFtHFABX6P37CoQ+QMdcL3OIq1Oh74NL1TuFaMNrcFQq6
	CGkWJTLrFZ6k6Z9ubCFI1FD6yRF6X3gNBV/CBHReMub+I/7dT/mM0936Q9KUQ9p9saWwMPeTgx2
	JmGxxKG2l5Wg8Wp2Z1AIzjAWPRPm8ELYyWB5EO6mSKKm0FDk3POC5jqAwFhfzzFUYv7hSGsSC8t
	IKUd2u4vfALFsNuZQz6MnKcUc+RMk8r5jh9GEvDB1GLhbFu/cNAiZS9WTYy+MB6O1y9d8D4KXT/
	N8Yfg0w5ZfpbDy+D5uxmHsOuitze5gWlG4u1dTnsdGFhfQfKXJn9kY67pwDKW3kT+vbUt2I=
X-Received: by 2002:a05:6830:6412:b0:81d:9acd:ee04 with SMTP id 46e09a7af769-85f0528fe51mr386304a34.0.1793820641158;
        Wed, 04 Nov 2026 11:30:41 -0800 (PST)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e55906sm2577422a34.18.2026.11.04.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:30:40 -0800 (PST)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] leds: tca6507: Fix use-after-free on unbind
Date: Wed,  4 Nov 2026 13:30:38 -0600
Message-ID: <20261104193038.91614-1-danishkhateeb03@gmail.com>
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

Since the LEDs are registered with devm_led_classdev_register(), they
are unregistered only after tca6507_remove() has cancelled the work.
Unregistering an LED that is on turns it off, which queues the work
again from led_assign(), and the work then runs after devres has freed
the chip:

  BUG: KASAN: slab-use-after-free in assign_work+0x414/0x5b0
  Read of size 8 at addr ffff888010d5c0c0 by task kworker/1:2/65
  ...
  Last potentially related work creation:
   ...
   queue_work_on+0xb6/0xc0
   led_assign+0x223/0x340 [leds_tca6507]
   led_classdev_unregister+0x26b/0x340
   release_nodes+0xb3/0x140
   devres_release_group+0x247/0x470
   i2c_device_remove+0xbf/0x1b0

Initialise the work before the LEDs are registered and flush it from a
devres action, which then runs after the LEDs are gone and before the
chip is freed, and drop tca6507_remove(). Flushing instead of cancelling
also makes sure that the queued writes reach the chip, so the LEDs are
really turned off. By the time the action runs, the LEDs and the GPIO
chip have been unregistered, and the work does not queue itself, so
nothing can queue it again.

Fixes: 1b5c2fa7081c ("leds: tca6507: Use devm_led_classdev_register() to simplify remove path")
Cc: stable@vger.kernel.org
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Changes in v4:
    - Squash the two v3 patches into one, flushing the work from the start (Lee)
    - Drop Andrew's Acked-by, since the code is now different from the
      version he acked
    - Rebase on for-leds-next
    - Link to v3: https://lore.kernel.org/all/20261028174348.64014-1-danishkhateeb03@gmail.com/
    
    Tested in QEMU on a next-20260930 KASAN kernel, with the driver built as
    a module and a test-only module that adds a fake I2C adapter, logs the
    register writes and adds a software node for a TCA6507 with two LEDs.
    Without this patch, unbinding with the LEDs on hits the report above
    (39 reports in 20 unbind/bind cycles). With it there are no reports in
    20 cycles or on unload, and every unbind ends with a write that turns
    both LEDs off (with v2's cancel, 7 of 20 unbinds left an LED on). A W=1
    build with GPIOLIB is clean. The code is the same as v3 with both
    patches applied.
    
    An LLM was used to help with this patch.

 drivers/leds/leds-tca6507.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 9afe2722986c..ffad476af625 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -711,6 +711,11 @@ static const struct of_device_id __maybe_unused of_tca6507_leds_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_tca6507_leds_match);
 
+static void tca6507_flush_work(void *work)
+{
+	flush_work(work);
+}
+
 static int tca6507_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -735,9 +740,12 @@ static int tca6507_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	tca->client = client;
-	INIT_WORK(&tca->work, tca6507_work);
 	spin_lock_init(&tca->lock);
-	i2c_set_clientdata(client, tca);
+
+	INIT_WORK(&tca->work, tca6507_work);
+	err = devm_add_action_or_reset(dev, tca6507_flush_work, &tca->work);
+	if (err)
+		return err;
 
 	for (i = 0; i < NUM_LEDS; i++) {
 		struct tca6507_led *l = tca->leds + i;
@@ -766,20 +774,12 @@ static int tca6507_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void tca6507_remove(struct i2c_client *client)
-{
-	struct tca6507_chip *tca = i2c_get_clientdata(client);
-
-	cancel_work_sync(&tca->work);
-}
-
 static struct i2c_driver tca6507_driver = {
 	.driver   = {
 		.name    = "leds-tca6507",
 		.of_match_table = of_match_ptr(of_tca6507_leds_match),
 	},
 	.probe    = tca6507_probe,
-	.remove   = tca6507_remove,
 	.id_table = tca6507_id,
 };
 

base-commit: fb511964723311e9a7223e424d725c58dde8307a
-- 
2.56.0

