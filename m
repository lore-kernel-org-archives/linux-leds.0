From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 1/2] usb: core: add support for HCD providers
Date: Tue, 12 Jul 2016 14:35:19 +0200
Message-ID: <1468326921-26485-2-git-send-email-zajec5@gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34176 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933186AbcGLMfw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jul 2016 08:35:52 -0400
In-Reply-To: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Peter Chen <peter.chen@freescale.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh@kernel.org>, open list <linux-kernel@vger.kernel.org>

When working with Device Tree we may need to reference controllers
(their nodes) and query for HCDs. This is useful for getting some
runtime info about host controllers like e.g. assigned bus number.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 drivers/usb/core/Makefile    |  1 +
 drivers/usb/core/provider.c  | 79 ++++++++++++++++++++++++++++++++++++=
++++++++
 include/linux/usb/provider.h | 39 ++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/usb/core/provider.c
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
diff --git a/drivers/usb/core/provider.c b/drivers/usb/core/provider.c
new file mode 100644
index 0000000..4b9165a
--- /dev/null
+++ b/drivers/usb/core/provider.c
@@ -0,0 +1,79 @@
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
+	return hcd_provider;
+}
+EXPORT_SYMBOL_GPL(of_hcd_provider_register);
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
+	if (args->args_count !=3D 0)
+		return ERR_PTR(-EINVAL);
+	return data;
+}
+EXPORT_SYMBOL_GPL(of_hcd_xlate_simple);
+
+struct usb_hcd *of_hcd_get_from_provider(struct of_phandle_args *args)
+{
+	struct usb_hcd *hcd =3D ERR_PTR(-ENOENT);
+	struct hcd_provider *provider;
+
+	if (!args)
+		return ERR_PTR(-EINVAL);
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
