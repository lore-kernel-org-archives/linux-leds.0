Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632979;
	b=01tOQGx8qFbvx9Y33QMmuYrL2cGFbdSQYoF3E+40w5CF2w1dgA2vW1ZmN4B7Gsqy41Uz
	 11bUUrux7QhCbiVXE+LicJrZY3fE/DmfaXFRf/b9z1UKOSHcv57QcHQM5GpNRMyBJRpzl
	 kOJZDo992tasSqS4OOmPDO20Xk0+3Sf+mCFXQ2uNqHpoP/2RvtN4cpMpqFdyS4lHIkYAg
	 +8ahmq8pbc1VVu5pl9Ukhl1UwhaZ+RFcID8G9gheXWtBSsioC1PAKEpTU4Cydh/BcGkwG
	 G8o2MiY0rI2GMZsO1ePWVZ2XdXJMMCIXOf9l4aDUUNssKCQV24YEN6NLXkdDHqZSgTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632979;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=r9+Y2yjyBbPjAsQv/8T6Rkzzfpw+c+Q8GgV3I8KV3SQ=;
	b=cya9eJOeA9+gBKD23Xp0ik7n+xFiWcsPyo+GupCwxik4q/rk2aCmMuZ9Y31ymIJvv4xf
	 jglRNx8SNCNER2vtuJaNpi0dTbfYCvo9XSd5T1S7HWZkjf71S2SE312UHijmFfcwwVkTT
	 w3aMg0ZQX/F4N9cmjB6J7L/eLRfx44BEbZ/X8G2nWGSWPcbRSqzh2x+XJJtifNib5SDar
	 8RKlt+T95TS+I7lsVvaXhwyvZRTDAr9kek5v4ltDW9gavYY4C+oay8C/cQmB9opbyu90j
	 8ztf5PJHc8aU4RVlx/yhBPsebmUmOJ6TlRZI/xX6Y2Ds0pCMYumoUuKuO5GJIagvYPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dN+erWME;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB860C411F;
	Mon,  2 Nov 2026 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dN+erWME
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793632978;
	b=HS7oYhr+WuIB+DduCxTTtDbjo5/OSOLCUtQzlRphQPEt3dCFPsqI7EjxTgop8LMqGlxi
	 9+ywBtYsr1qNwSjcf28e36z/NbPCOYCV+BnmHaDbKYTe0bwcLZqTrBoD7yYegykABD0ZJ
	 SMFRdQ9HuHRr4Ok4rTriTd+dw2qdbbwgHVNSp5qYUr2RjxF+v7sKQZCoLhFvq7ruzq2KZ
	 2s0bkxQpCEoPLwOLCeYyreppy9fpzXpCZg5nJVY6orTaBYkw0g0NbOvkg8+N37abPwmcZ
	 gwWx1TedQyoDRSuR/hC+R7SEUbPk00pC2BgOMK09qw1URABLY6STpvwwUGZekDAO0/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632978;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=r9+Y2yjyBbPjAsQv/8T6Rkzzfpw+c+Q8GgV3I8KV3SQ=;
	b=JOPUS4E+oW0C+8hUfNNIKjL5BAxCfCoGBzY5GWrKAEG+d5qtwou9a2HFWsexUcdewquV
	 w53rSXtxND5qbMFTmGbSBQM/Zx/CPw64KJPsx0umn0kx4UbRbdd0wWjJqZeydsDU0l8Du
	 eCipFDwXReSAz843PPqkfjISKF12FaBPZCW4IQ/aoQ2DBzMZyaB/TaRWK/k8W/W05FkUb
	 l2q64gCjIXeqUpnWM+teuQwizyh83dI7v5jnNW7td5CmYwB07Xq/lldAD2PFsfHNdHFb0
	 9StluOxEJ77wO00rhjs2Rq2rPo0WV/vjw8WhzMSTBd+slO/+BC4AEwYHH1i6kJbrw7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA2231F00A1C;
	Mon,  2 Nov 2026 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632978;
	bh=r9+Y2yjyBbPjAsQv/8T6Rkzzfpw+c+Q8GgV3I8KV3SQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=dN+erWMEFPVNMbSJn8utrAwHdbDXcfIXhmRJ5+AVg3xXMVf03upW4cCib0GaSYvua
	 tHAFclFx2vVVkkgchO9ROQl7qyQWTfmTHH7OO/14hjjp1CHi76afDLUIZPDoX0wMmb
	 aPbbUCWRQmztJadsfsuvkrebakXlZY3vXMfwAhMf0kd1H+IdSuLtLQVOHmB7O/gPCf
	 bpVGxiSCrU5TfKPTh1pYkSHCwLKxGAoBcMC3CnydfMNl1CvgVOfxeBJc5+hddSeQMF
	 Stt1jPOkNXxC4Guv4hZ+0wHeEWn18P/2owjlvbudT8iyQo+ax/M87WgVMW1ygFUFaS
	 5uxZ/MhL4ptsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 47E714656B;
	Mon,  2 Nov 2026 15:22:57 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/2] media: pwm-ir-tx: regulator support
Date: Mon, 02 Nov 2026 17:22:55 +0200
Message-Id: <20261102-6768-irled-v1-0-c7064f3afed1@protonmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpS9pyFbEoBiOCtIikcXfF8
 i3+D+DREXookwAOT/K0LhEiTaAd7TIgoy4aJJdKCC6Z0sowcjN2rMBMmd5ak1sNMdgc9nR9s6r
 +7Y9mwnZ/D3DfD+eHIGtuAAAA
X-Change-ID: 20261102-6768-irled-9e368faa84a7
To: Sean Young <sean@mess.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793632976; l=909;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=1Yz8iX3gDW/P2tgbVxR2nYPw4xtfogUB2xJ/TKPL5hs=;
 b=113z/dYN4qrLGSqf1+2d6F+mseuCwhk6lycW1Q0C0mqDlihLX8wKsQ//QBiP3qB/evPwZ5yPU
 RjjEdRsZaEWCDoBRX+Y8wYjGwJvuEQkn0cQLB0DkCS1h2h2ErZyN+RO
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds optional power-supply property for PWM IR LED,
because some boards, like Xiaomi Redmi Note 9 phone, have the LED
connected to the eMMC power rail. If the eMMC is powered down, IR LED
can't function.

Patch 1 adds dt-bindings documentation for the power-supply property.
Patch 2 adds regulator management to the driver.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (2):
      dt-bindings: leds: irled: pwm-ir-tx: add power supply support
      media: pwm-ir-tx: add regulator support

 .../devicetree/bindings/leds/irled/pwm-ir-tx.yaml  |  4 +++
 drivers/media/rc/pwm-ir-tx.c                       | 37 +++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)
---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20261102-6768-irled-9e368faa84a7

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


