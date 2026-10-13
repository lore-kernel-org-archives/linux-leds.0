Received: from mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C746A61E
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870019; cv=none; b=mAdiygO7FnswSdibOTJ6tHkBJ4vVDvlddNnsdjQ+XI+2XB2062DjhAfYtHlPbf+PU1844NeTrqu8Vqubqdw4HXtOk/aatrZgXz2lD+yM1Z3VgZ+p3tQozQqd9IO+CGjBW03d30Q6FXdwiL28MgblaODdflbhnUxLTgRb0Vv/yAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870019; c=relaxed/simple;
	bh=xdB/9KT+9W+e1jGR3r0MHV8vrXYNxD2NfzG/66HLEgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGkt8T5z/ZnDd62RHV6JIGW6g1mqJYGsZ3GwHNKLI8Rke5tVeVgrcpvxXBjcIqcVYjYP2u26Hu1PbEu1DLOMyHfxg+Sfx1wB8FU8lt+yilVLGJtNoNMcHjbXjHAjl9Dgh2m3VoBvG8y3hHA1XNZNSbo5OhY19IsYZNsbEDOhjXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pZvJMDjo; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pZvJMDjo"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xdB/9KT+9W+e1jGR3r0MHV8vrXYNxD2NfzG/66HLEgY=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870015; v=1; x=1792474815;
 b=pZvJMDjoriAffXKl4SEnKX6EpQC4jR2XLkYNaIcGQ+nTd+Fk6ijEMTXJ7bE34K3QkcS9zOi5
 3OB7dVh4L4te7p56i6olF21UQiCpMwpi2bXnbMOVRjMfb15MlcgTXriQDH6TD4C8wY8Wo6D6NJD
 3Wo+kgevkdYaCNGm2xCpbegwSLGQ5JJTWzT0mEusYz0TalKmlMn4k4xgQWpXgAQpse6iOEmGbdU
 Ttxx72dxW9wGMCk6qmPVUM3O7wCVF/DTyitve7Km1Ws8RXlTO+cLr2m5VDUbjHv+DLfTd36tQQf
 j6EZ7g3T4iR3v09QHIUmWmAR0ClrNQD36l2m8CpDcUNnA==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c3876d7d6838b81e;
	Tue, 13 Oct 2026 05:40:14 +0000
X-Mizu-Trace-ID: c3876d7d6838b81e
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 12 Oct 2026 22:39:55 -0700
Subject: [PATCH v3 1/6] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-aw2013-aw20xx-rename-v3-1-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=1243;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=xdB/9KT+9W+e1jGR3r0MHV8vrXYNxD2NfzG/66HLEgY=;
 b=xh7/q+cloxNase1lbGHIVTIOwBRPmaONQqWLxux6lHIRXbq8U62eTR4DKiPZ5cvPwm1ciJ1Cl
 qUVzA17d9nhDFtN9oOCWkUN/8h/1u1hcjnwQH1UrS5Hvr2qgMF6i/mR
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

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
2.55.0

