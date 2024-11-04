Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131F07083E;
	Mon,  4 Nov 2024 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729993; cv=none; b=crszSZ8afLU5drPOvRBWjePCscFYt4tUottNo0OupkFlgpPhnvIZaBz138rULayRmDhTk/BIvQsS+tbCEQTFU5N0czHrS62wgnAY3OQJX4S5MNmA82TjjLj4TeJD4mBxOSMo/+WFfNu2YF7FUeXpIEa41pcpf/RaHzZQWoTQuC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729993; c=relaxed/simple;
	bh=IL6ApZj/AEN4ogtSsw2hRDlMG6U3NVDiHfarNqZTetA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/hoIrWQ0Y2KxlraXZsAWcyqyc7DH/wRDZ5e79vEJmupCVfk2AnnpA/oX7vsnpEfi7KiLr1rUFGINS0Ol1higSMtmvun2M0hGU5yZGW+XH2irL9UQJFUtw/sdU5/m+LafnIkr2Wgfz7h/CkloIaP8wucxAnwEJcHg+1p1AWqoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3IYBSb7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3IYBSb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE647C4CED2;
	Mon,  4 Nov 2024 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729992;
	bh=IL6ApZj/AEN4ogtSsw2hRDlMG6U3NVDiHfarNqZTetA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3IYBSb7xqbhf/xrxG9aeUpCxW5cDBX8vb4IgsqY4dWay8VPnglmCXpA8J+7eQtvN
	 WbKW+IDLv9D9sD6EPSgP3zhPitQmrzThubRwPz6PLbnlbQujWHGDBzlNchq3QyPGsM
	 PCpe16y8X8FlSbFUppTsjSuKOc5lO62vHyzVKcwrE7uWCry3brGx5GOX6eXXa00ZtU
	 xM2TabW4nDXffivE99LGchAf1TOSmZu+MpQNhdjiuTASiBRfwj4MsEwqt26hrxgVjU
	 s4dGLrcP9NZuC121jUto6vthrwQaIlcW+c0H453fo/UhUdPrT4iAKdD/2iCxdukdQc
	 alOI5kkjB0JzQ==
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
Subject: [PATCH leds v5 05/12] dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
Date: Mon,  4 Nov 2024 15:19:17 +0100
Message-ID: <20241104141924.18816-6-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104141924.18816-1-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
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

