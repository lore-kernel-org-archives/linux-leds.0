From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 0/1] usb: add HCD providers
Date: Wed, 13 Jul 2016 14:42:12 +0200
Message-ID: <1468413734-9569-1-git-send-email-zajec5@gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468326921-26485-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi again,

This is my second try of getting HCD providers into usb subsystem.

During discussion of V1 I realized there are about 26 drivers adding a
single HCD and all of them would need to be modified. So instead I
decided to put relevant code in usb_add_hcd. It checks if the HCD we
register is a primary one and if so, it registers a proper provider.

Please note that of_hcd_xlate_simple was also extended to allow getting
shared HCD (which is used e.g. in case of XHCI).

So now you can have something like:

ohci: ohci@21000 {
	#usb-cells =3D <0>;
	compatible =3D "generic-ohci";
	reg =3D <0x00001000 0x1000>;
	interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
};

ehci: ehci@22000 {
	#usb-cells =3D <0>;
	compatible =3D "generic-ehci";
	reg =3D <0x00002000 0x1000>;
	interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
};

xhci: xhci@23000 {
	#usb-cells =3D <1>;
	compatible =3D "generic-xhci";
	reg =3D <0x00003000 0x1000>;
	interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
};

The last (second) patch is not supposed to be applied, it's used only a=
s
a proof and example of how providers can be used.

Rafa=C5=82 Mi=C5=82ecki (1):
  usb: core: add support for HCD providers

 drivers/usb/core/Makefile     |  1 +
 drivers/usb/core/hcd.c        |  8 ++++
 drivers/usb/core/provider.c   | 99 +++++++++++++++++++++++++++++++++++=
++++++++
 include/dt-bindings/usb/usb.h |  7 +++
 include/linux/usb/hcd.h       |  2 +
 include/linux/usb/provider.h  | 39 +++++++++++++++++
 6 files changed, 156 insertions(+)
 create mode 100644 drivers/usb/core/provider.c
 create mode 100644 include/dt-bindings/usb/usb.h
 create mode 100644 include/linux/usb/provider.h

--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
