From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] leds-bcm6328: add more init configuration options
Date: Thu,  8 Oct 2015 12:35:54 +0200
Message-ID: <1444300555-13988-4-git-send-email-noltari@gmail.com>
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

This patch adds more init register configuration options:
- Serial LEDs multiplexing.
- Serial LEDs clock signal low/high polarity.
- Serial LEDs data signal low/high polarity.
- Serial LEDs shift direction inverted/normal.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/leds/leds-bcm6328.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 4de8a85..898a804 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -41,6 +41,11 @@
 #define BCM6328_SERIAL_LED_SHIFT_DIR	BIT(16)
 #define BCM6328_LED_SHIFT_TEST		BIT(30)
 #define BCM6328_LED_TEST		BIT(31)
+#define BCM6328_INIT_MASK		(BCM6328_SERIAL_LED_EN | \
+					 BCM6328_SERIAL_LED_MUX  | \
+					 BCM6328_SERIAL_LED_CLK_NPOL | \
+					 BCM6328_SERIAL_LED_DATA_PPOL | \
+					 BCM6328_SERIAL_LED_SHIFT_DIR)
=20
 #define BCM6328_LED_MODE_MASK		3
 #define BCM6328_LED_MODE_OFF		0
@@ -366,9 +371,17 @@ static int bcm6328_leds_probe(struct platform_devi=
ce *pdev)
 	bcm6328_led_write(mem + BCM6328_REG_LNKACTSEL_LO, 0);
=20
 	val =3D bcm6328_led_read(mem + BCM6328_REG_INIT);
-	val &=3D ~BCM6328_SERIAL_LED_EN;
+	val &=3D ~(BCM6328_INIT_MASK);
 	if (of_property_read_bool(np, "brcm,serial-leds"))
 		val |=3D BCM6328_SERIAL_LED_EN;
+	if (of_property_read_bool(np, "brcm,serial-mux"))
+		val |=3D BCM6328_SERIAL_LED_MUX;
+	if (of_property_read_bool(np, "brcm,serial-clk-low"))
+		val |=3D BCM6328_SERIAL_LED_CLK_NPOL;
+	if (!of_property_read_bool(np, "brcm,serial-dat-low"))
+		val |=3D BCM6328_SERIAL_LED_DATA_PPOL;
+	if (!of_property_read_bool(np, "brcm,serial-shift-inv"))
+		val |=3D BCM6328_SERIAL_LED_SHIFT_DIR;
 	bcm6328_led_write(mem + BCM6328_REG_INIT, val);
=20
 	for_each_available_child_of_node(np, child) {
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
