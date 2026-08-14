Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D13BFACC
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 23:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749080; cv=none; b=JTb6Io6Q4g3K1JNz3VVgF48t0c3i6Koxb0uZbnxIQvKxUzgby79GoMihylVzhM0/7OibRAvvdjMC608jqa20sMPeUOVtmm+QucsVfv2ByVNdFOPNqGbWhBJ62I/V8u5KwTA3if0Uuvgj55qi2tWx1JBGLisVHIaqNsGHMzHqFzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749080; c=relaxed/simple;
	bh=RYpZR0sDvcmY2jyiYZI8hciof+9imEqq4HibNvC273c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBkkB7LfGeCl+5Mypj+erijynaGU4YivTGsVItL/3TT4YS00WtmTAsv8coQEbef7SrzkdwydTu7uyx9q706zjCt0y22HmcSMGwD4rhfEycnbcpE7OjEMWj/1CXaHZnITfS9yIXeJkaNbCj2g5A3UAZrWiWfdAIVGwTjEdaHJk+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EA1hwfEz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EA1hwfEz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so64648b3a.2
        for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749076; x=1787353876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Haj+ZUCxdgSDciu2KvIwXZABMW8X15ZHr1Rjfu8Dbzk=;
        b=EA1hwfEzqbHH7ARy3QZRd8LirsHpv83R27QGDLyUQftT2OXZhTJ7n+h4219/9H8fFM
         rk7g0QWkVXYOCd8+qXvCEM/S6tP/HaFuDfmY/LyP8SXWP7MyqauscNFmrASpJhakBgNG
         QLbZyE+dnoi9Fxm1cqcFRSem2HoVLMA+eb60tC9WxpzzyqaMOgY4IVF26FOnzsnQX8vC
         9muXib160oNFt32vb+v1UXQhIW3xJWIZrX0Mn7m0kOmHm2xJH+RuMp6iNH50phv010WP
         UPWlfRi59lT0l3KBM6heRV6fnVpd9QAfvVuGCBXXlyocS6kv8Sth8M7HFmylWilJUTfb
         6xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749076; x=1787353876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Haj+ZUCxdgSDciu2KvIwXZABMW8X15ZHr1Rjfu8Dbzk=;
        b=kyMcH0I7uZejh63QT1I0rf7JwaaFE7LIxSNrncJ2gjdSSIgvq966cfSdDGUEQM1A0N
         OVtNTqXIg/kF5kEUD7s/mWU9DZbihb64c2cATM1kWurV8AoPYUojIITBuq+JZDTJPbAc
         8K0iDG6+m7ALyAoAgRyyteCrXN/YrKUeeqCo/RcbN4H4D5KPy65kkmxw5DWCkAPlsHJm
         NEerW7c2f+Z3XeSk1Fn+z3u4dIFpNbNnWL7vT50a3JBF7du3mNOweB8Xy7xq4Ns8AGj+
         79cChI5kEfkN2a+nh4Ul6y4+V/LzUD0VggzvRfZQrVGuxiBG0ioY+pTDYZpT38BDOOgW
         6IiA==
X-Forwarded-Encrypted: i=1; AHgh+RortdV77DaYXo6WlWussbGtuWm9LefYO/XYJ8a8moilwehQmaF+ETvkyDFQlSnzivkrGFsCSluzl6mD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjnsze7H5F99shYTdLS0vMzQj1WktAWS3y5sks1/pC+/85z7Nc
	Zx1ZJAK+mgKI+UhGBEkMRepBOtSl/AUeSNHrwNbeDO1nwosu5IbZqpUsGbZHuue8
X-Gm-Gg: AR+sD13AwllXfBVDJHzKCFFXEKQOOO8IPs39AVfCAVBPijESpgj9nafBVYwcxZ9Pu1G
	/MkXlO1kgoNTkjlNZooR0iy3Pdny+VVxrdBgq8h/hUORL0758QY1oIhxtgqLZ/o+lMIXmV6kJfI
	8OuqfcHuqenLnFi8rLwrq5gxPS6tO+qF4Vkw2u4MRFQhJjuo6fX3JBEL0fpE4Ki/mf0FxKlVZWv
	cuky6NwYS+UmN8MzUtRW4+9Uqyrvz5iK8B7nBcSw5bx6BKYnA4a756JIErKkA+DvA7sxoH5Si9m
	DCLr3yvzS9HYpuS7nZVmniCGHCtTj2+wXv8fZ6l3T4pSOvT4M9NVm0+rYuBzw1uYsfR5yRfWq9r
	71to28Mv4kENjilBSfoIaixf1A9u3PCGfAk3PTjhd2DoOjzSQLT6uuHFUckzFolxRrJrH3HNFky
	6sVU1zBbKKPcUYjBgCN39Y/czxlfyFbaz4DUcBMsPc46ZqE38ONN2ks+pEuqOLt+fQxc30fEuMR
	WLop2eQtGk=
X-Received: by 2002:a05:6300:2208:b0:3c3:ab31:3d2c with SMTP id adf61e73a8af0-3cc71e684aamr10443008637.35.1786749075489;
        Fri, 14 Aug 2026 16:11:15 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm8563607eec.11.2026.08.14.16.11.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 16:11:14 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v5 3/7] i2c: mux: Propagate software nodes to channel adapters
Date: Fri, 14 Aug 2026 16:10:51 -0700
Message-ID: <a758b93f394ecfd4dfa65517782530d4a8c45e39.1786747084.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786746757.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device Tree channel nodes are associated with the adapters created by
i2c-mux, but equivalent software-node descriptions are not.

Find the software-node child whose reg value matches the channel and
attach it to the new adapter. Preserve an ACPI primary node when present
and extend I2C firmware-node adapter lookup to match the attached
secondary node.

Track attachment ownership so failure cleanup cannot detach a
pre-existing node. Keep the owned node attached through child-client
removal, then release its reference after adapter deletion.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 24 +++++++++---
 drivers/i2c/i2c-mux.c       | 77 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 3ec04787a737..f39575ee0244 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1876,12 +1876,22 @@ int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
 }
 EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
 
-static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)
+static bool i2c_device_match_fwnode(struct device *dev, const void *data)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+
 	if (device_match_fwnode(dev, data))
+		return true;
+
+	return !IS_ERR_OR_NULL(fwnode) && fwnode->secondary == data;
+}
+
+static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)
+{
+	if (i2c_device_match_fwnode(dev, data))
 		return 1;
 
-	if (dev->parent && device_match_fwnode(dev->parent, data))
+	if (dev->parent && i2c_device_match_fwnode(dev->parent, data))
 		return 1;
 
 	return 0;
@@ -1891,8 +1901,9 @@ static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)
  * i2c_find_adapter_by_fwnode() - find an i2c_adapter for the fwnode
  * @fwnode: &struct fwnode_handle corresponding to the &struct i2c_adapter
  *
- * Look up and return the &struct i2c_adapter corresponding to the @fwnode.
- * If no adapter can be found, or @fwnode is NULL, this returns NULL.
+ * Look up and return the &struct i2c_adapter corresponding to the @fwnode,
+ * including a secondary firmware node. If no adapter can be found, or
+ * @fwnode is NULL, this returns NULL.
  *
  * The user must call put_device(&adapter->dev) once done with the i2c adapter.
  */
@@ -1922,8 +1933,9 @@ EXPORT_SYMBOL(i2c_find_adapter_by_fwnode);
  * @fwnode: &struct fwnode_handle corresponding to the &struct i2c_adapter
  *
  * Look up and return the &struct i2c_adapter corresponding to the @fwnode,
- * and increment the adapter module's use count. If no adapter can be found,
- * or @fwnode is NULL, this returns NULL.
+ * including a secondary firmware node, and increment the adapter module's
+ * use count. If no adapter can be found, or @fwnode is NULL, this returns
+ * NULL.
  *
  * The user must call i2c_put_adapter(adapter) once done with the i2c adapter.
  * Note that this is different from i2c_find_adapter_by_node().
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 681a201c239b..3bca123907b3 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -20,11 +20,13 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
@@ -33,6 +35,7 @@ struct i2c_mux_priv {
 	struct i2c_adapter adap;
 	struct i2c_algorithm algo;
 	struct i2c_mux_core *muxc;
+	struct fwnode_handle *swnode;
 	u32 chan_id;
 };
 
@@ -264,10 +267,60 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 	.unlock_bus =  i2c_parent_unlock_bus,
 };
 
+static struct fwnode_handle *
+i2c_mux_get_channel_swnode(struct i2c_mux_core *muxc, u32 chan_id)
+{
+	struct fwnode_handle *dev_node = dev_fwnode(muxc->dev);
+	struct fwnode_handle *mux_node, *child = NULL;
+	u32 reg;
+
+	/* A software node supplementing ACPI is the secondary fwnode. */
+	if (!is_software_node(dev_node)) {
+		if (IS_ERR_OR_NULL(dev_node))
+			return NULL;
+		dev_node = dev_node->secondary;
+	}
+	if (!is_software_node(dev_node))
+		return NULL;
+
+	if (muxc->arbitrator)
+		mux_node = fwnode_get_named_child_node(dev_node, "i2c-arb");
+	else if (muxc->gate)
+		mux_node = fwnode_get_named_child_node(dev_node, "i2c-gate");
+	else
+		mux_node = fwnode_get_named_child_node(dev_node, "i2c-mux");
+
+	if (mux_node) {
+		/* A "reg" property indicates an old-style firmware entry. */
+		if (!fwnode_property_read_u32(mux_node, "reg", &reg)) {
+			fwnode_handle_put(mux_node);
+			mux_node = NULL;
+		}
+	}
+
+	if (!mux_node)
+		mux_node = fwnode_handle_get(dev_node);
+	else if (muxc->arbitrator || muxc->gate)
+		child = fwnode_handle_get(mux_node);
+
+	if (!child) {
+		fwnode_for_each_child_node(mux_node, child) {
+			if (fwnode_property_read_u32(child, "reg", &reg))
+				continue;
+			if (chan_id == reg)
+				break;
+		}
+	}
+
+	fwnode_handle_put(mux_node);
+	return child;
+}
+
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
 	struct i2c_adapter *parent = muxc->parent;
+	struct fwnode_handle *channel_node = NULL;
 	struct i2c_mux_priv *priv;
 	char symlink_name[20];
 	int ret;
@@ -324,8 +377,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 		priv->adap.lock_ops = &i2c_parent_lock_ops;
 
 	/*
-	 * Try to populate the mux adapter's of_node, expands to
-	 * nothing if !CONFIG_OF.
+	 * Associate the mux adapter with its DT or software-node channel.
+	 * DT support expands to nothing if !CONFIG_OF.
 	 */
 	if (muxc->dev->of_node) {
 		struct device_node *dev_node = muxc->dev->of_node;
@@ -364,6 +417,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
+	} else {
+		channel_node = i2c_mux_get_channel_swnode(muxc, chan_id);
 	}
 
 	/*
@@ -374,6 +429,16 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 				      ACPI_COMPANION(muxc->dev),
 				      chan_id);
 
+	if (channel_node) {
+		ret = device_add_software_node(&priv->adap.dev,
+					       to_software_node(channel_node));
+		if (!ret)
+			priv->swnode = channel_node;
+		fwnode_handle_put(channel_node);
+		if (ret)
+			goto err_free_priv;
+	}
+
 	if (force_nr) {
 		priv->adap.nr = force_nr;
 		ret = i2c_add_numbered_adapter(&priv->adap);
@@ -408,6 +473,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	return 0;
 
 err_free_priv:
+	if (priv->swnode)
+		device_remove_software_node(&priv->adap.dev);
 	kfree(priv);
 	return ret;
 }
@@ -429,7 +496,13 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
 		sysfs_remove_link(&muxc->dev->kobj, symlink_name);
 
 		sysfs_remove_link(&priv->adap.dev.kobj, "mux_device");
+		/*
+		 * Keep the software node through child removal. The adapter
+		 * device is cleared on deletion, so release the software-node
+		 * attachment reference via the saved handle afterwards.
+		 */
 		i2c_del_adapter(adap);
+		fwnode_handle_put(priv->swnode);
 		of_node_put(np);
 		kfree(priv);
 	}
-- 
2.50.1 (Apple Git-155)

