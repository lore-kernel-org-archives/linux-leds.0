From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 1/1] usb: core: add support for HCD providers
Date: Wed, 13 Jul 2016 14:42:13 +0200
Message-ID: <1468413734-9569-2-git-send-email-zajec5@gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468413734-9569-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stefan Koch <stefan.koch10-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

When working with Device Tree we may need to reference controllers
(their nodes) and query for HCDs. This is useful for getting some
runtime info about host controllers like e.g. assigned bus number.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
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

diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
index 9780877..20b91d1 100644
--- a/drivers/usb/core/Makefile
+++ b/drivers/usb/core/Makefile
@@ -9,5 +9,6 @@ usbcore-y +=3D port.o of.o
=20
 usbcore-$(CONFIG_PCI)		+=3D hcd-pci.o
 usbcore-$(CONFIG_ACPI)		+=3D usb-acpi.o
+usbcore-$(CONFIG_OF)		+=3D provider.o
=20
 obj-$(CONFIG_USB)		+=3D usbcore.o
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index d2e3f65..55079a0 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -46,6 +46,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/phy.h>
+#include <linux/usb/provider.h>
=20
 #include "usb.h"
=20
@@ -2712,6 +2713,7 @@ static void usb_put_invalidate_rhdev(struct usb_h=
cd *hcd)
 int usb_add_hcd(struct usb_hcd *hcd,
 		unsigned int irqnum, unsigned long irqflags)
 {
+	struct device *dev =3D hcd->self.controller;
 	int retval;
 	struct usb_device *rhdev;
=20
@@ -2885,6 +2887,11 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	if (hcd->uses_new_polling && HCD_POLL_RH(hcd))
 		usb_hcd_poll_rh_status(hcd);
=20
+	if (usb_hcd_is_primary_hcd(hcd) && dev->of_node)
+		hcd->provider =3D of_hcd_provider_register(dev->of_node,
+							 of_hcd_xlate_simple,
+							 hcd);
+
 	return retval;
=20
 error_create_attr_group:
@@ -2952,6 +2959,7 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	dev_info(hcd->self.controller, "remove, state %x\n", hcd->state);
=20
 	usb_get_dev(rhdev);
+	of_hcd_provider_unregister(hcd->provider);
 	sysfs_remove_group(&rhdev->dev.kobj, &usb_bus_attr_group);
=20
 	clear_bit(HCD_FLAG_RH_RUNNING, &hcd->flags);
diff --git a/drivers/usb/core/provider.c b/drivers/usb/core/provider.c
new file mode 100644
index 0000000..0de769a
--- /dev/null
+++ b/drivers/usb/core/provider.c
@@ -0,0 +1,99 @@
+#include <dt-bindings/usb/usb.h>
+#include <linux/slab.h>
+#include <linux/usb/provider.h>
+
+static DEFINE_MUTEX(hcd_provider_mutex);
+static LIST_HEAD(hcd_provider_list);
+
+struct hcd_provider {
+	struct device_node *np;
+	struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, void *data)=
;
+	void *data;
+	struct list_head list;
+};
+
+struct hcd_provider *of_hcd_provider_register(struct device_node *np,
+					      struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, v=
oid *data),
+					      void *data)
+{
+	struct hcd_provider *hcd_provider;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	hcd_provider =3D kzalloc(sizeof(*hcd_provider), GFP_KERNEL);
+	if (!hcd_provider)
+		return ERR_PTR(-ENOMEM);
+
+	hcd_provider->np =3D np;
+	hcd_provider->of_xlate =3D of_xlate;
+	hcd_provider->data =3D data;
+
+	mutex_lock(&hcd_provider_mutex);
+	list_add_tail(&hcd_provider->list, &hcd_provider_list);
+	mutex_unlock(&hcd_provider_mutex);
+
+	pr_debug("Registered provider for %s\n", np->full_name);
+
+	return hcd_provider;
+}
+
+void of_hcd_provider_unregister(struct hcd_provider *hcd_provider)
+{
+	if (IS_ERR(hcd_provider))
+		return;
+
+	mutex_lock(&hcd_provider_mutex);
+	list_del(&hcd_provider->list);
+	mutex_unlock(&hcd_provider_mutex);
+
+	kfree(hcd_provider);
+}
+EXPORT_SYMBOL_GPL(of_hcd_provider_unregister);
+
+struct usb_hcd *of_hcd_xlate_simple(struct of_phandle_args *args, void=
 *data)
+{
+	struct usb_hcd *hcd =3D data;
+	int type =3D USB_HCD_PRIMARY;
+
+	if (args->args_count >=3D 2)
+		return ERR_PTR(-EINVAL);
+	else if (args->args_count >=3D 1)
+		type =3D args->args[0];
+
+	pr_debug("Looking for HCD type %d of %s\n", type, args->np->full_name=
);
+
+	switch (type) {
+	case USB_HCD_PRIMARY:
+		return hcd;
+	case USB_HCD_SHARED:
+		if (!hcd->shared_hcd)
+			return ERR_PTR(-ENOENT);
+		return hcd->shared_hcd;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+struct usb_hcd *of_hcd_get_from_provider(struct of_phandle_args *args)
+{
+	struct usb_hcd *hcd =3D ERR_PTR(-ENOENT);
+	struct hcd_provider *provider;
+
+	if (!args)
+		return ERR_PTR(-EINVAL);
+
+	pr_debug("Looking for provider for %s\n", args->np->full_name);
+
+	mutex_lock(&hcd_provider_mutex);
+	list_for_each_entry(provider, &hcd_provider_list, list) {
+		if (provider->np =3D=3D args->np) {
+			hcd =3D provider->of_xlate(args, provider->data);
+			break;
+		}
+	}
+	mutex_unlock(&hcd_provider_mutex);
+
+	return hcd;
+}
+EXPORT_SYMBOL_GPL(of_hcd_get_from_provider);
diff --git a/include/dt-bindings/usb/usb.h b/include/dt-bindings/usb/us=
b.h
new file mode 100644
index 0000000..adec026
--- /dev/null
+++ b/include/dt-bindings/usb/usb.h
@@ -0,0 +1,7 @@
+#ifndef _DT_BINDINGS_USB_USB_H
+#define _DT_BINDINGS_USB_USB_H
+
+#define USB_HCD_PRIMARY			0
+#define USB_HCD_SHARED			1
+
+#endif
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 66fc137..d064613 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -210,6 +210,8 @@ struct usb_hcd {
 	 * (ohci 32, uhci 1024, ehci 256/512/1024).
 	 */
=20
+	struct hcd_provider	*provider;
+
 	/* The HC driver's private data is stored at the end of
 	 * this structure.
 	 */
diff --git a/include/linux/usb/provider.h b/include/linux/usb/provider.=
h
new file mode 100644
index 0000000..c66e006
--- /dev/null
+++ b/include/linux/usb/provider.h
@@ -0,0 +1,39 @@
+#ifndef __USB_CORE_PROVIDER_H
+#define __USB_CORE_PROVIDER_H
+
+#include <linux/of.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+struct hcd_provider;
+
+#ifdef CONFIG_OF
+struct hcd_provider *of_hcd_provider_register(struct device_node *np,
+					      struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, v=
oid *data),
+					      void *data);
+void of_hcd_provider_unregister(struct hcd_provider *hcd_provider);
+struct usb_hcd *of_hcd_xlate_simple(struct of_phandle_args *args, void=
 *data);
+struct usb_hcd *of_hcd_get_from_provider(struct of_phandle_args *args)=
;
+#else
+static inline
+struct hcd_provider *of_hcd_provider_register(struct device_node *np,
+					      struct usb_hcd *(*of_xlate)(struct of_phandle_args *args, v=
oid *data),
+					      void *data)
+{
+	return ERR_PTR(-ENOSYS);
+}
+static inline void of_hcd_provider_unregister(struct hcd_provider *hcd=
_provider)
+{
+}
+static inline struct usb_hcd *of_hcd_xlate_simple(struct of_phandle_ar=
gs *args,
+						  void *data)
+{
+	return ERR_PTR(-ENOSYS);
+}
+static inline struct usb_hcd *of_hcd_get_from_provider(struct of_phand=
le_args *args)
+{
+	return NULL;
+}
+#endif
+
+#endif /* __USB_CORE_PROVIDER_H */
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
