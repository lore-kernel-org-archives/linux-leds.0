From: Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
Subject: [PATCH v6 1/4] usb: gadget: Introduce usb_gadget_giveback_request()
Date: Wed, 24 Sep 2014 22:43:18 +0200
Message-ID: <1411591401-5874-2-git-send-email-sojka@merica.cz>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
 <1411591401-5874-1-git-send-email-sojka@merica.cz>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411591401-5874-1-git-send-email-sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.vokac-veUE7cmDK2A@public.gmane.org, Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

All USB peripheral controller drivers call completion routines directly.
This patch adds usb_gadget_giveback_request() which will be used instead
of direct invocation in the next patch. The goal here is to have a place
where common functionality can be added.

Signed-off-by: Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>
---
 drivers/usb/gadget/udc/udc-core.c | 16 ++++++++++++++++
 include/linux/usb/gadget.h        |  8 ++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-core.c b/drivers/usb/gadget/udc/udc-core.c
index b0d9817..f7b3151 100644
--- a/drivers/usb/gadget/udc/udc-core.c
+++ b/drivers/usb/gadget/udc/udc-core.c
@@ -106,6 +106,22 @@ EXPORT_SYMBOL_GPL(usb_gadget_unmap_request);
 
 /* ------------------------------------------------------------------------- */
 
+/**
+ * usb_gadget_giveback_request - give the request back to the gadget layer
+ * Context: in_interrupt()
+ *
+ * This is called by device controller drivers in order to return the
+ * completed request back to the gadget layer.
+ */
+void usb_gadget_giveback_request(struct usb_ep *ep,
+		struct usb_request *req)
+{
+	req->complete(ep, req);
+}
+EXPORT_SYMBOL_GPL(usb_gadget_giveback_request);
+
+/* ------------------------------------------------------------------------- */
+
 static void usb_gadget_state_work(struct work_struct *work)
 {
 	struct usb_gadget	*gadget = work_to_gadget(work);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index c3a6185..f795e95 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -1013,6 +1013,14 @@ extern void usb_gadget_set_state(struct usb_gadget *gadget,
 
 /*-------------------------------------------------------------------------*/
 
+/* utility to give requests back to the gadget layer */
+
+extern void usb_gadget_giveback_request(struct usb_ep *ep,
+		struct usb_request *req);
+
+
+/*-------------------------------------------------------------------------*/
+
 /* utility wrapping a simple endpoint selection policy */
 
 extern struct usb_ep *usb_ep_autoconfig(struct usb_gadget *,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
