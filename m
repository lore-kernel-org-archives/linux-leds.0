Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585583;
	b=wH7ukvdf00sbGZBom47tiUxnxX8nmGcbBJ8VicloQwIWEZaWVKBpFTcqcwhtGDsnO0zf
	 b8c+57zTzeoH45s9CD4gzEnVuqEPvxjeIRt+5+B/YHAkO8DUlpy5QFT0pSj40Jp80Je4x
	 XFcmXb+OCmJtHB9S73uH6KXtsj9lRSTWQmH7hQoVYcDrbh7cnegh5iridXvdFUwQ/B2Ca
	 gb+r3Yyy3jdESLdS4cpxVSWuKDwtDQvh1L07oeg0DHfIss/QblDS/dV7vhgcrEeDFXzK9
	 JysptPNy1CbkWlQnQZymFeMnlGDbvLDZVBrW1gZXEhRB2ID2scKVK5upfyZtnUKV3eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585583;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oPZPff7AFCJTvcprCc+r9tCNwzIc/Brea+tOpGgX6d4=;
	b=0yja93bY/1C9Da23wyQgYQ8FQmK4jWyluE7H0eY8jIqka5bzaP8rkT2Wt77M/jL/hDc/
	 0r1TYuBsHeLzpJbZvW7/QVSmEKMuNj8wLClTrV7457zQCC0ML3I8CUS7NN01JA4SIw/At
	 yWs2vHY6s9vUYwLf6GwRGSy5z0M+QMC17UbJFM67ZjXQN7t61zW4j8ir9uPix3tFVfnQP
	 WbseD17y6PX1h1O0WdmMOGcQFsT5uOUA85d7qrTBNURDyVoPRTQEHqt/mMV/0a9CQmvwk
	 gp2+BbSdtl2HOEYt5aNYFb2kZZmM6S8dlFfiorj4kgFx/9TfiafbJMBFImvJF2h1ALg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPGJulMl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A160A261F;
	Mon,  2 Nov 2026 02:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPGJulMl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793585582;
	b=tcyVuZPumlVKqkFTIez/NMYvLAuhiFsi/Mw6WyDwT0+gkjKGLHv/F7BehMu5URK9niZ+
	 rRCxwWnHCZGuoYRVLKb/xuhqQVlzuz1Ur2Yd3zptQBt7BE5CDy8PF+ziMdt1BGqWJbboe
	 wDIvlAc6X/GrJD2kIxuhwxntK54+DAe4D/QtILMyWlIwLkuKmeFMEwsBa635YXEpuH4sV
	 1QesfpFJ3R0BlOHgmBiXwf0WPEjDewWVQH66vgs9YL65JJ25Ac38wANZcplBmSs5ZMXpp
	 dNUdRaxt39IHZCuhCm9JKkVyLb6ysp/G9gCifpr/SzjGgjFBf9z4B7gP+7ueEkdJCXw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793585582;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oPZPff7AFCJTvcprCc+r9tCNwzIc/Brea+tOpGgX6d4=;
	b=HFG3gy8eATpPs9vYfXmvi4eXjCKDuhn1tJYftjCq46wODPGdU+NfYa7KeMQdrySPm5kL
	 bw1U8LfxJ9Ldk/kW5NSyzUilxiwsnbRpWkag2jsyM5EySSGfkgvOFyQRMeAf2p782io22
	 eS065j3H7HvaajfZrLVm4cczJnHrY724ANSZ2uy33OrXOtDFgdsSJ4TzbAwlFJN8gHMsf
	 g1718AdWXTx2SsqG0kTQz7Q8YYu2AQ0KSsX8tfAu8pyAsDmqvKJpS2PClgGZzi2ISYgDn
	 Xk35GbGkkyRX0M62j5eSGqvDhfz991/4WicIRenmXlHzjyOx8lvmmWI1nLKUlqNZw2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 714CA1F00A27;
	Mon,  2 Nov 2026 02:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585582;
	bh=oPZPff7AFCJTvcprCc+r9tCNwzIc/Brea+tOpGgX6d4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dPGJulMlCxawAbkZTWbC2U1/9v07aYnmZ7EDF1/kKxuQ3J2lRTtlzH48vlVrexpXg
	 hNItSe+1bkDCu1UhKGLazZKbTecsUvdrbYKX9CqBDzixiq2jTkP+59quMspAdjj3O4
	 9G1b7I2Qc54V1xvTdFfKMh/Cmcg5guUgv9wjoczZcnANd642wY/U6OSQPZaVDzPz1y
	 lUGpQwzO7nbds5Gke9eu5sHOiwKmOj4c1HFEjYCGiC1j9w80QHDf/w0swqDoL4tQeN
	 L4ItPYeyWxl10r8CAZCIcVoqv1trx7vI2l1ArEyujicHMPJX4MOZSMZcyMRLl7q4aL
	 sqQjWTJWTeaRw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E3D5846316;
	Mon,  2 Nov 2026 02:13:00 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 01 Nov 2026 21:12:27 -0500
Subject: [PATCH 03/10] leds: rgb: ktd202x: Never program an on time of zero
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-ktd202x-et6326-v1-3-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
In-Reply-To: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793585579; l=1451;
 i=joseph@telaak.dev; s=20261102; h=from:subject:message-id;
 bh=BQnhsK3g/4tt6UBpzegrKNnjIOdXU+LjWaFg/kEIEHY=;
 b=aa6+XTZ8sxMI8F0yqi8aFZw2HBodQCUNACWVvmGhJpL+u3H0n+so0U2cyX8gicIFzf+K+ZKIA
 rGsxSYOs6yLDBhpjyG5N+7KGuywL0+8VbcpxNUbBsSOeHn+JjlLOTS4
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=OmwSusdK4grZpiuZVfCZAvYyqz9FBkNemsV1EnHyVr4=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261102 with
 auth_id=1382
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

blink_set() turns delay_on into a fraction of the period in 1/256 steps.
When delay_on is less than 1/256 of the period, for example 1 ms on and
1000 ms off, that fraction is 0: the LED stays dark, while the timer
trigger reports that it is blinking with delay_on = 0.

Use the shortest on time the hardware has, 1/256 of the period, and
report it back.

Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/leds-ktd202x.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 482af28e8..8c890ea5a 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -304,8 +304,12 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 				  (delay_total_ms - KTD202X_FLASH_PERIOD_MIN_MS) /
 				  KTD202X_FLASH_PERIOD_STEP_MS);
 
-	/* Integer representation of percentage of LED ON time */
+	/*
+	 * Integer representation of percentage of LED ON time. A value of 0
+	 * keeps the LED dark, so use the shortest on time instead.
+	 */
 	on = (*delay_on * KTD202X_FLASH_ON_MAX) / (*delay_on + *delay_off);
+	on = max(on, 1);
 
 	/* Actually used delay_{on,off} values */
 	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS + KTD202X_FLASH_PERIOD_MIN_MS;

-- 
Git-155)


