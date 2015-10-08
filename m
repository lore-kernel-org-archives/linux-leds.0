From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] Documentation: leds: update DT bindings for leds-bcm6328
Date: Thu,  8 Oct 2015 12:35:55 +0200
Message-ID: <1444300555-13988-5-git-send-email-noltari@gmail.com>
References: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444300555-13988-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch adds latest DT bindings for leds-bcm6328 init register
configuration.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/leds-bcm6328.txt | 10 +++++++++=
+
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/=
Documentation/devicetree/bindings/leds/leds-bcm6328.txt
index f9e36ad..3f48c1e 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
@@ -29,6 +29,14 @@ Required properties:
 Optional properties:
   - brcm,serial-leds : Boolean, enables Serial LEDs.
     Default : false
+  - brcm,serial-mux : Boolean, enables Serial LEDs multiplexing.
+    Default : false
+  - brcm,serial-clk-low : Boolean, makes clock signal active low.
+    Default : false
+  - brcm,serial-dat-low : Boolean, makes data signal active low.
+    Default : false
+  - brcm,serial-shift-inv : Boolean, inverts Serial LEDs shift directi=
on.
+    Default : false
=20
 Each LED is represented as a sub-node of the brcm,bcm6328-leds device.
=20
@@ -110,6 +118,8 @@ Scenario 2 : BCM63268 with Serial/GPHY0 LEDs
 		#size-cells =3D <0>;
 		reg =3D <0x10001900 0x24>;
 		brcm,serial-leds;
+		brcm,serial-dat-low;
+		brcm,serial-shift-inv;
=20
 		gphy0_spd0@0 {
 			reg =3D <0>;
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
