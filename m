From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 4/9] dt: leds-lm36274.txt: fix a broken reference to ti-lmu.txt
Date: Fri, 28 Jun 2019 09:12:26 -0300
Message-ID: <6ac637e0394adfdc95bfc45dad6bfc7bf631fca3.1561723736.git.mchehab+samsung@kernel.org>
References: <cover.1561723736.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561723736.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

There's a typo there:
	ti_lmu.txt -> ti-lmu.txt

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/leds/leds-lm36274.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
index 456a589c65f0..39c230d59a4d 100644
--- a/Documentation/devicetree/bindings/leds/leds-lm36274.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
@@ -6,7 +6,7 @@ up to 29V total output voltage. The 11-bit LED current is programmable via
 the I2C bus and/or controlled via a logic level PWM input from 60 uA to 30 mA.
 
 Parent device properties are documented in
-Documentation/devicetree/bindings/mfd/ti_lmu.txt
+Documentation/devicetree/bindings/mfd/ti-lmu.txt
 
 Regulator properties are documented in
 Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
-- 
2.21.0
