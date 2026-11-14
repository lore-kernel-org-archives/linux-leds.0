Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696958;
	b=mCwBuf73ypOJ1XqTPkf71dxr51mA33CWzFviovo7kvd47gg5YXuyQKFJnZ6SaU55W4Gb
	 bl0otU3crJv7/LQq8LcOYy9jGf3pu0gqA2i820K2nPSXbAU2re6UxYo1dh4a48FnZuP9T
	 1MPeasrhmWto7MsmwdSA7KA+RNZsgWELObzmvjKuKXVS65sGdpvgoO0dPPWZQgYAW3VDw
	 u+TEh0hvi4rRm6po6HZVoLdia3qhS0EvRAqTA61/TRflUdRrCREWbdCM95pE6h0mU0PRB
	 ztaWWIJJS1JWfoAOkuFI0sJ73FSIup+iHhgBFhFa5Dzj50nFKpPCoNfYUdtTXI6OHGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696958;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=O/GD0QgnnZwMvdktT7NT9OGWuvPKrj5mWOce8WRE98A=;
	b=JJVmmeIPwgxiwtfrR62TVm6vPkJ77G+EN3/Jqq6qNsJwo1ATh++Kg1yGbWVs+Fi192Zz
	 2z5u2e+1/cGQzaWCZndmjCnKZHo4hj5H2QPh2FiOw7q5D9xdgPJTc9uWugpLUyTMhaGrG
	 g/JxIU5hMBbp+XuDRopB7SJeC9gTl0WlBNDljWYXdCXykKijxjfXem5VRDqXBbW0r+C1L
	 gj0GCkBYTnxKqEBOujJPsrpOoqM8tnwgMYkCgnT/Bru5QbXglDTgtAd/igmU3Lly47/jm
	 sgCVVTFqk3qGbIytNuXYh9hFMpp4FDKk/g/4o/rXfHQrps+/FRAC/BvAq+U35Xec0pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=KqjtwfQP;
	arc=none smtp.remote-ip=91.218.175.156
Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91A606A327
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 22:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A91A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=KqjtwfQP
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uf3ZtzEWO+m9+O53q0wwm3lcvSxqUa9UE4kohOpFHzM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696955; v=1; x=1795301755;
 b=KqjtwfQPmfmOUStAfngYV44ctCJA5wfY9aaoEqfheEoccSBTlrpsSFmt2Y9qY09OmJi/Mj9e
 Av3M6JWOKKt1QZItRjN+6PWTt378L7FEQXGnwXhsi31kvKsCJbzBaMZ6sp1LD1aD60Or8FBiVbP
 DcO422xXTa2kxY/T1O+/la5U1bgR75iXooPQT0OZr13BXMQjy45FwmkW+ZG56bdzWcAe/ZP2+a1
 W+2gUGksDokOKD3cD1DiM6uJGhgQsz52hHXWXLYhVBpbFT/jeRrnneKCjzFvhYb7h4Aelfh0NAH
 2KX5sY1Lr24dj/0eFQrARZsepDyMMe7s4oreKxkfDsgNg==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f484dd51aafbe032;
	Sat, 14 Nov 2026 22:55:55 +0000
X-Mizu-Trace-ID: f484dd51aafbe032
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 14 Nov 2026 15:55:16 -0700
Subject: [PATCH v7 3/4] drivers: leds: aw2013: Leverage C99 for-loops
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
Message-Id: <20261114-aw2013-aw20xx-rename-v7-3-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=1264;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=uf3ZtzEWO+m9+O53q0wwm3lcvSxqUa9UE4kohOpFHzM=;
 b=hkM0bnEFmFYAinsmqbfdtCuL8zEg/ANwt0Wrz9gBhDZO5qQDrd/A5ryH6QcJ76RdbXWnh1DpS
 zgFVm+81m5mC/hb4sBUw2ijLHpiSiSTpmIjorLSFRRru0mGO/IlrH/O
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Declare the int within the for-loop declaration rather than as a
separate local variable. To make the code more readable.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 2937a0f92d92..7fe7e9dae903 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -72,7 +72,7 @@ struct aw2013 {
 
 static int aw2013_chip_init(struct aw2013 *chip)
 {
-	int i, ret;
+	int ret;
 
 	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
 	if (ret) {
@@ -81,7 +81,7 @@ static int aw2013_chip_init(struct aw2013 *chip)
 		return ret;
 	}
 
-	for (i = 0; i < chip->num_leds; i++) {
+	for (int i = 0; i < chip->num_leds; i++) {
 		ret = regmap_update_bits(chip->regmap,
 					 AW2013_LCFG(chip->leds[i].num),
 					 AW2013_LCFG_IMAX_MASK,
@@ -142,9 +142,7 @@ static int aw2013_chip_enable(struct aw2013 *chip)
 
 static bool aw2013_chip_in_use(struct aw2013 *chip)
 {
-	int i;
-
-	for (i = 0; i < chip->num_leds; i++)
+	for (int i = 0; i < chip->num_leds; i++)
 		if (chip->leds[i].cdev.brightness)
 			return true;
 

-- 
2.56.1

