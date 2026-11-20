Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795133260;
	b=yZZ55Hmcg/faCUPJaRde532JSskv9kjHiVJJ6ptptmmKAsvT/nWoRlMn36zdyWFmLPZE
	 R97lui5Q7UtHuILryqMcKfRXVYxrFLJON3NTszX5XPP3KAcryqFILXfEJrfXE9tD/RxuK
	 erPjbSypN2IVerv2jyrBMi72+Y7/PyjPReASESJsGPDfyIJAKifnLVQHsAXUS0uQtimY9
	 nPYMJ/vJ6QBhga3ZF+CT/3B3D4VAKSYpNwo0YgkzH+YGai6wBO2adbF22b7bS4THD9rDt
	 iH3zS5LsAxyXmwJ8fUTbboEgYTajQsAkjPn8qyfH5zzglKVUDyS7uNMW4yLD3Rze2ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133260;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Jc0nPylsr1rL1f2PPi36sYoBqXj53o2+7e6SqClsDLU=;
	b=SjH/ho6sGcTEyQG/d+TrwR7MxqfAI7b+kHwhwCGx1dI02agTyu108YKT7mPlmihvD97r
	 23Ac/yEIcH8RKzcBqrWdg8/6F78TPEpXWoQrKExjk+9moxEKemIUzi72zsYFtgH6pyX5u
	 /jXgQ9Hdlxmkwp3cvlHUE33K0U85Ix8uBRNROX1iOiFnnL/5NOxoRMfyJThBheVNrgaD+
	 w4jj8GFcyDLhdEy5isy2/NRKY3EwvAEo1wjbZumkYnBdE6PdZ0t5yG3d3IWKIr2uaM4an
	 2QJSM2AQVOhmmpvlOy9eQMQkgTBffX0PmbvcRzppb701aCyhF8Ma/Qu0CB1/Js46ncw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9RQoE0n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330860A3835;
	Fri, 20 Nov 2026 00:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9RQoE0n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795133259;
	b=I5PRYBT75liYndJe6hHDL/IEBBZTwiiDeXs/mcSUgq6BBrbDBV8L6diJAAq857CluaYH
	 9uG8FcvfD83rkcMmUaL6FfD4dCBWpHWKCCNYqA2TsZKCrzx1JAOiwyodmpOWZ4o/CPaS8
	 bNA6vmNOvo+4NYrxMRY8HpKUPJNfRJzHs3ByPvoLaxFUS4S91E22xwNcSxVdLojZX48Sp
	 wJdBcIvcDEvJIQMIpxRX+BubHoTR0+ERsVFvI1Pe176uSSBddU1GBSuK1kUxTK4JuSfi7
	 BpTqUYCAFr5mMli4rUuqVDmladWx4a7rHg1K2Pcqx+Gz7+/aqiMb3bhn5zpGkOolFbg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795133259;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Jc0nPylsr1rL1f2PPi36sYoBqXj53o2+7e6SqClsDLU=;
	b=c5Xf3FtEjo43FxEwmXR9P4jxlP/1XsQ3cSh41s6joxN7e5O+U8+Ao/T8thmy+xLVV1nC
	 DhtKfb7DsLMmMXmIDzbNF/4K0YqY0QTvf62Z4fNWI4L0kt4WJAqtMlwmdiLiI+Rl8tG2e
	 8twY5YD5ugWS+TFdQFPJb7+84wKeo2OVS7zekhbizVe3oLyn7cOxv6q0dyLjl/40YB8fb
	 r8MqhSmj3BPylHLZO5pPYNZW8w0MbLayKjnHiZd4yiWSr4YytR0FZsOCtXt6PigKIGE+B
	 gsr40VtznXcF/zWa7tDNgFHarQyc/YyWFvvz9d4ZrZgOOYJVz1dSoMeZFwQGTIRA5xw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C24131F000CF;
	Fri, 20 Nov 2026 00:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133259;
	bh=Jc0nPylsr1rL1f2PPi36sYoBqXj53o2+7e6SqClsDLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=M9RQoE0nv9j4rbZXlhry3i0Z39Qy5YN2DWE40eZKXH6ok7VwwE14dxjJh2AXCAEsA
	 h+jCwC48l7Xz3OkDgadEsBp9dSJngiji+SiJGqrE8c55G4zXxlDKuTGpYy70G8aiv0
	 Ng0NXruyR54uwiiLDCDa9CSdOt7+QXNM66eP9mpI9WluRLW+fjVrOrZV51XsJtBInZ
	 RQhscEMerG6dF0jQATroTNCYApq3IfcFhMnLKj+LhmXrdSUToLDa7tDjldQXszIkJr
	 U6+9hrS8Usnni2s4lFSXXTpQDTWqp72wN5UM0nC/KJRgvnjt2oM+35YJ3kSHpcscYo
	 rb0MLZ3Egg4dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 62CEE42508;
	Fri, 20 Nov 2026 00:07:36 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 19 Nov 2026 19:07:32 -0500
Subject: [PATCH v3 10/11] leds: rgb: ktd202x: Fail the probe when the chip
 does not answer
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
Message-Id: <20261119-ktd202x-et6326-v3-10-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
In-Reply-To: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795133254; l=1869;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=OJe/EYmuFIG8R4e+vz1BB2LHRGry4ICpQG555k8sYHU=;
 b=HI4e7R0kulxw8jyu6welwE9+MnABBrSknENG7F2CL+tCb6NdZFjP+9Y/EqwNULco68oRzo19i
 atU8ceU3E94DeUP+9/gv6uO6En//nXi2jSthhqHdSwe7as7rgDWkKbB
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The driver never reads from the chip: the register cache starts from the
defaults. So with a wrong address, or no chip at all, the LEDs get
registered anyway, and every later write fails.

The reset write can't tell: the KTD202x does not ACK the byte that
resets it, and its data sheet says to ignore that. So once the reset
is done, put the chip to sleep, as ktd202x_chip_disable() does, and
fail the probe when that write fails.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/leds-ktd202x.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index a95910817e76..c9f1a5234d6e 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -738,20 +738,29 @@ static int ktd202x_probe_fw(struct ktd202x *chip)
 {
 	struct device *dev = chip->dev;
 	int count;
+	int ret;
 	int i = 0;
 
 	count = device_get_child_node_count(dev);
 	if (!count || count > chip->num_leds)
 		return -EINVAL;
 
+	/* The KTD202x does not ACK the byte that resets it, so ignore the result */
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
 
 	/* Allow the device to execute the complete reset */
 	usleep_range(200, 300);
 
-	device_for_each_child_node_scoped(dev, child) {
-		int ret = ktd202x_add_led(chip, child, i);
+	/*
+	 * Nothing is read back, so a failed write is the only sign of a missing
+	 * chip. Leave it asleep until a LED is turned on.
+	 */
+	ret = regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_SLEEP);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reach the chip\n");
 
+	device_for_each_child_node_scoped(dev, child) {
+		ret = ktd202x_add_led(chip, child, i);
 		if (ret)
 			return ret;
 

-- 
Git-155)


