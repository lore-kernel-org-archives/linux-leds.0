Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794528110;
	b=M8soTMbrIgcH3RqUvj/0hyiRHI7gMzGKRK+0ZP4p0/jZQ2hGA7Fz4ZfFjyEUacJ3uVkY
	 RehG3LlvQn0+/pdZ4cXkGpUpzH4mdWYELy82xXnQ84Ey8H0g0T3Ic+d+4YY4K2u8LXdBd
	 Tig8DSnmatleON1SBfHOfGZZ5rUITjW2R6mYeuxZUKRHTH/YbdGObrNZ1UfNHp7/csCBz
	 wBJMcPPNada0MUQlktaRCJ68osidylk+M8s9tWdxo1+VUF7zHw0gA22j9G+s5SIypUB9f
	 dh0K68jRX5vNUyzCmaXxyXVS2TCoYMk9/1DhvCEj/wdXM0HudQ9CBFBsAWoZ2vAf/KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528110;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	b=JQMSPyGpAKC8thKm8i+hvTKhlA0nG3oKybY3Qi2Vp6RQOlIHJqUQyw5fFBlfelen+Hkt
	 QiulI8TloC0gesKsyVHEF7oDdup4b3kQ9nQlpkgSm5I7hGb6CqGP1/9Nmh4xihe6lc01P
	 uRF3Ngz68DmIXYzkDhU34u7KbZQy30welrXCQb2J0hQpHIR54NTQHUMwS9YPdRXRgIg2c
	 H6J1AG4li3PGxygSPwzL5cofy9GK5LbfUgjG7xcY0C0IKfecds6HFPw3YwL2gFnTFES/t
	 vX3n1ZO7Ja0svToDmR5TIq1upUe2p+d+17MvvJjds8W3gVS4bFukI5k0SmgykhNIXjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOPczxm7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C572606A31C;
	Fri, 13 Nov 2026 00:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOPczxm7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794528109;
	b=uaSuZbjK+GImvI1uOgKvxbPn+KRFiV79FkLNXIh+V5dkOWo/74XDfLnweUq++unMIfBW
	 +JDA+f/JfspWqoCJWboK51gq2o9DckNoV1VcFh0cB3oiArXZqRkwMPCGK7jByN29NIL9N
	 I2SXNODxPEZKNsCiZmL69etm5QTJMbQsxmmqgzSQXq1ZZmIyTYk4wecAIZ/5U6VebXwhN
	 iULdtOUUVYN43VwkFILAATl+X9k5tTqbBYroBaYtOW/CbQHO5J4RQoMM4yrpbfUNVYe5W
	 6UR+gCYpexIavtG8lLUMeKm+4LZNE7dN8BN+j0MIU2Q5MKPLQkUJk1Pc8kKJcsd/crA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794528109;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	b=VjkwVdwlgRuZJjK3aeE+nn+VorxnLzjaimNJ4fzOA+lWts548zuEiqj9iFl2aUjfNCzH
	 iGa4vfRvgGUC0Fn/lD7wBtQAezCBFsRvq4o5JeZzGjkpxYos9j9cs8HBJPf6lWOklun1V
	 Z8wVVMWzLAmELNzokAiMxztF8dVcm4etkVjf42QVI68cf4gDqYs2884OXW3dqJ0ipLAXS
	 8e2KhM3IV8iZKD3t2si6Y0ifmCNXuA3q/DnbCuAnSjR2uRKLicYtkny5AwMeMyImfcE+o
	 Rhhh7ttTKjw5oSl7mMR+g/KONvEukFOmEFNlupOe+LYEhtkdoaTpQNYYdti5dDhZyhQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D38D1F000C5;
	Fri, 13 Nov 2026 00:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528109;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nOPczxm7l7gBt+ZjtJuxJRNVae9aNC0YKmas0+K+hs8Kmgi2dE/TrdGT21hJNJE+0
	 O+bPAfNsZmXS7XyyNVIz5oM59ikDdLLk6Bak0X/pk7d5LGbp74g8uoKnRMW1cQQLBD
	 HtolUcw6wveZtoYP1pO/lAZWQpn1FCjG1FxJB8Ws/YgSovOmrAP0le2tHyWFUD0/pP
	 yJ1zGmbAyMH9W6n4xXCWKUNZlFf3/WvkjOCAhMDL+0nSNbBQ4BQL2+EDARRYN5oE9/
	 vb/ZYlf66jvURVAmpDP+5v/W1LuTPAivxBFQvufIsckf2r+5OrLusotRcaNZBPq9Sj
	 Th8Wj/+Na33fQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7C8E94751B;
	Fri, 13 Nov 2026 00:01:48 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 12 Nov 2026 17:01:40 -0700
Subject: [PATCH v6 1/3] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
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
Message-Id: <20261112-aw2013-aw20xx-rename-v6-1-251eca340abc@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
In-Reply-To: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794528107; l=1313;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 b=PHoLXXJpq6LFiiYGOFQeZQwDpZqO3NVvyXiVC5l2+4nKvpgjk4B6qqfv4z07GmCNmC9Te7E30
 KxZvat078ebBS/rmeO+/BqWW36x6b8oFMeDBeYmRV9EprJ0l5M/xs/t
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org
Content-Transfer-Encoding: 7bit

From: Paul Sajna <sajattack@postmarketos.org>

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.56.0


