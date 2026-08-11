Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4C631AF2D
	for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2026 05:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424575; cv=none; b=ou1aZNzhboj5P9/ZvSKsn+5CHrrz81E52SXz/7ZrTc2gfonn1yjfY0o4XSZEpNgJCtA3fAs+qnVpTygcz8ynkf0C1p+RVJctLVJUIq7pbBc1Cz+qJjnTv13MjCxCVwsXK7bx7GJtG8K7d/+Z5+PD8uf+GGFx4qiDcqPGQB/bLWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424575; c=relaxed/simple;
	bh=umZL5fn54uXO5itW8ulnK8HBtP6zF1pdNSWeGLlPGMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLI1xeZwBCF+nFZxbET7RbzhaUiuLG6bRDPjk4F7NEGmH7kkR/4ZDQH0BNDaxTdtd6kggggG55K9hB2xzWJoao7i89dc9SWUnFobl/WWWrZa1VbuqZxUUN37KOSraePhSHcIg7xhk8Q7vzJBOrlAITlT25N1yKH9il/Cf4Avhw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGdUgFkQ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGdUgFkQ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2364434a91.1
        for <linux-leds@vger.kernel.org>; Mon, 10 Aug 2026 22:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424572; x=1787029372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Unu0bdi+4TO6yVD3obvp/HhqPNGfRa0ua+IlLQHYNqs=;
        b=oGdUgFkQAt2/jUvrXsDKMRk3l+XzskqVkBRDpeHUntjcfw4feSMKgsdpJvuhFUjMow
         aELEz5QedJlMe8VW1lIW0KGarfhsIFLByZBYQA0R4T0yjAniSbjlamQvyx6U/AZZp38w
         qtZCAi8x5DsT/rP0OPfWRyzCQ9Jr1FANeHbG7DBUmazzfWtqHz0MzFgPg1qBwj/smKPG
         NB2L2KGu1lUQ8GiQ4TADRZF03GOW6Qa4qswW3aytR97oycAK6V3jtGhTwOdce1bz6mQh
         Ecy7MdMGR20vuqHjXro3WEXRKqYtz0zP+KpgZpJ7QsAmURscD/3gs39aED+zFtt3w0gj
         cD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424572; x=1787029372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Unu0bdi+4TO6yVD3obvp/HhqPNGfRa0ua+IlLQHYNqs=;
        b=q/B1GsKvJLPFnlyNJY0fWna3iKFEmxg/7rGJ/v/x0NJiig7O8MWtzlaRQ0WQamH7HF
         pTvpEk5c8A0les6aroPPhLo6Qx7c2ZL+Rb3x81cJAFe+RNedqkbABox7wgtIHcsqK0cD
         xz8OfRWLYYbVVhFbl8FrD4FdYyBfY3C4jCK1oqtjIxoW0fL96VS6uq4Ljz+MJo07TTfz
         87lIeVKbm8j63MP7M1gchDI03X8mU/6aMLDyOBXn26rux4TaKr89b0jK4uJhiyEvkrBk
         VjZ4xrsvrZhGfC+Q5+sGq4vSQmjYQDUYYpRo311o4ZdVCt7fdqHaqohgRAhP2AaWa+Ll
         0vTw==
X-Forwarded-Encrypted: i=1; AHgh+RrgxFZHBWodRCwmx9rNXzNpLRbkCx8E05t8xNwkHcj8kQCaxs7N7PMT5lFjYbe9s6ZDx4kLkqqtc18F@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUrQ9MkcYj22LEHWnXVB59c5AUEY8UMlXvAn2201KZdvewef8
	8vhHXfAEZYw+DDQZGr9cymSb73GO6tFbRVaFxZ8T8cJzn9raWlpsaHv7
X-Gm-Gg: AR+sD10wpEJVZ2IY431kw3kQJQRVsLKauXaaxke4lrUNAwiY7svKheA8f/9d6WK+cev
	5zBFR8n3qNOeruqEuATA7xP6Z+S2kJqgLcV7hq3HvQvIcpvEvk/fcDwvUoP9qjEavgCnL5O/eAE
	E2dTugTivHcDdywnP0oK8j/aaxtys91B8kC5/kgZEPBN5NuuqGp4KxerNVoRA6z/LrSZ8GyqeRF
	GtrSjuWHOqkl+rauEnL0FTBjKvpSEC3RLGE/p7uoFK6iMKVHc0RynKnQFbYAlxpzTYwM8NV4KGv
	ZnVVuErzZtzd/MIcJKCve1cHpfRRABQVu2viQpb9wx/El0ZRD9V/ihaGzTYselMQsXpv4jcKHtD
	roUrlL9W2NOrJMEtfNnkx8Be/OM+g4dHUElYKd1Wo+5B3anaPtOU6cnY/dcR2uE9SYDuHpiCgtG
	l4hub7CMOn379sss+Bm2bs/nlNl+SU8UBtE1+KmcGwhnxuvvLxz+7Wtb7r57Vl2A9/DfV6hNTgf
	NThSI3sIZaMQ5jQhlNNYSmNwpUehDqVza3RZ34+nOsAgnJYuw==
X-Received: by 2002:a17:90b:3b42:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-392ec6e960emr616624a91.21.1786424571561;
        Mon, 10 Aug 2026 22:02:51 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619cf07dsm660421eec.4.2026.08.10.22.02.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 22:02:51 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v3 3/5] i2c: mux: Propagate software nodes to channel adapters
Date: Mon, 10 Aug 2026 22:02:42 -0700
Message-ID: <144d1e75321e084642f10086e554cccf51fa98ac.1786423898.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786423898.git.ahmadexp@gmail.com>
References: <cover.1786423898.git.ahmadexp@gmail.com>
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
assign it to the new adapter. Keep a reference for the adapter lifetime
so downstream clients can find the channel by firmware node.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/i2c/i2c-mux.c | 69 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 681a201c239b..8b54bb13c613 100644
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
 
@@ -264,6 +266,55 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
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
@@ -324,8 +375,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 		priv->adap.lock_ops = &i2c_parent_lock_ops;
 
 	/*
-	 * Try to populate the mux adapter's of_node, expands to
-	 * nothing if !CONFIG_OF.
+	 * Associate the mux adapter with its DT or software-node channel.
+	 * DT support expands to nothing if !CONFIG_OF.
 	 */
 	if (muxc->dev->of_node) {
 		struct device_node *dev_node = muxc->dev->of_node;
@@ -364,6 +415,18 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 
 		priv->adap.dev.of_node = child;
 		of_node_put(mux_node);
+	} else {
+		struct fwnode_handle *fwnode;
+		const struct software_node *swnode;
+
+		fwnode = i2c_mux_get_channel_swnode(muxc, chan_id);
+		if (fwnode) {
+			swnode = to_software_node(fwnode);
+			ret = device_add_software_node(&priv->adap.dev, swnode);
+			fwnode_handle_put(fwnode);
+			if (ret)
+				goto err_free_priv;
+		}
 	}
 
 	/*
@@ -408,6 +471,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	return 0;
 
 err_free_priv:
+	device_remove_software_node(&priv->adap.dev);
 	kfree(priv);
 	return ret;
 }
@@ -429,6 +493,7 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
 		sysfs_remove_link(&muxc->dev->kobj, symlink_name);
 
 		sysfs_remove_link(&priv->adap.dev.kobj, "mux_device");
+		device_remove_software_node(&priv->adap.dev);
 		i2c_del_adapter(adap);
 		of_node_put(np);
 		kfree(priv);
-- 
2.50.1 (Apple Git-155)

