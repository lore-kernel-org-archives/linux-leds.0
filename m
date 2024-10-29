Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6296920695D;
	Tue, 29 Oct 2024 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210213; cv=none; b=EWCSHnxiN9jHcjZfnkcNZOEPOzEOVIqQSmXh38z2x9rgyns5GwRKGUa8tQfY3Kw7YWLAGMOnFFcV5I05gOY658ogWMZSLM4Fa2CJBzQUmwLNLdG+u58QaTp8NelbLn61bZhDB3cQeqUQpb36nrwfN2Qv6aFTZSwqoiRn6FTiDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210213; c=relaxed/simple;
	bh=IL6ApZj/AEN4ogtSsw2hRDlMG6U3NVDiHfarNqZTetA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DycsjnTzyXLcuUZzbEpyKH7Ds25HaShkFBvKGlavPWCum7JVdnTdbl4i3uwScumoPYj1F5a/VX5Fk8h7rzi3qJNvEfZ4nm/mLako6dPlIS8HIr1Bo0jtCul5BiibPHJOAK1n1wfxmhbLxuqt8fTDLR7P0nvGORNYtQ3pfzvlJno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzoJrKMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzoJrKMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F99C4CEEF;
	Tue, 29 Oct 2024 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210213;
	bh=IL6ApZj/AEN4ogtSsw2hRDlMG6U3NVDiHfarNqZTetA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dzoJrKMMUZmNxW6oCOv8DyCPLOolrL4FWgTZXgFuhv2qyHLrNUSzGMe56qawboHBy
	 Hv30HYsGtzrogM+C7y9PGyNbEnf0Sk6SMHQeUvetOXN7c8fMAFbKC6ggTpZKRs0NfB
	 RT/jQ76paPOHZWicGPMzJxvTiHAfuH10RF2RmbGXv3POyEIci9A/Y4yJN15DjHhDCW
	 tty05gd+e1R/bM9S0C/AFBl6+WgDqrQPPeIUeuEy3FKyuMrhL+VnRstvUcoOomer50
	 4+nh8V1XQEH6BHbv6Sl4s+NV538HS7BMLMHHmxpgtPj1NvA/JOqteI+dC3Yzbe3Jv2
	 F61POGOhdBefw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH leds v4 05/12] dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
Date: Tue, 29 Oct 2024 14:56:14 +0100
Message-ID: <20241029135621.12546-6-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the cznic,turris-omnia-leds binding with interrupts property,
specifying the global LED brightness changed by button press interrupt.

Signed-off-by: Marek Behún <kabel@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
index 34ef5215c150..f52f6304c79e 100644
--- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
@@ -23,6 +23,12 @@ properties:
     description: I2C slave address of the microcontroller.
     maxItems: 1
 
+  interrupts:
+    description:
+      Specifier for the global LED brightness changed by front button press
+      interrupt.
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
@@ -56,6 +62,7 @@ additionalProperties: false
 examples:
   - |
 
+    #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -65,6 +72,7 @@ examples:
         led-controller@2b {
             compatible = "cznic,turris-omnia-leds";
             reg = <0x2b>;
+            interrupts-extended = <&mcu 11 IRQ_TYPE_NONE>;
             #address-cells = <1>;
             #size-cells = <0>;
 
-- 
2.45.2

