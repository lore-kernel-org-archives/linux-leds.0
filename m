Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCD346E7D
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779307423; cv=none; b=ly0GeVI4tcY3jGPI6c5olRwNYhAKgLZxe8nZyJ4iZlS11PC9ZTjMwtAl7PwyFC9FkmUY6HRarBO3/RqJusZxPL5fDG1Zsp9tSw5L/cmqzZNEMXVTSehqXHTekkwTwpI0LY2XaXTSCJrBt3jr6Gh1NZSaDXi5Ux58AcEtRWWGPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779307423; c=relaxed/simple;
	bh=w5MLQIaRpVU5SwkEFl0ywM8vQ/Epne164k8OfCiap98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRYzt5eZcIfak+CivcmRuudUmdgb/dZ0r+fvNCnnwSAxfHxlrUXBZfiMhKaP/H1k1+VsERPtB3ILfmqxBiqvW314dieP9huZxSYDKvvESj9AYzGJTgbpOKKHhhSHmYCxVycWWuatOJsIxM3W2R1WJRq2mfH/iJg4N2N0MC9XVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Md6ZBBi6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md6ZBBi6"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5164dafcf97so53622181cf.2
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779307421; x=1779912221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJFwvFMqSeGHKF7YuuKfX7SCPCAWVzw/mYZh++eDvbM=;
        b=Md6ZBBi6L891kRa3CYITpsH0nbL6nj2kyNEb29KVvms2HET7uyFGQyVCyFLfkbcovr
         kB1Zlf98XxoHyKoKIoRaSbMdGjgnKZ6cm02BkNGVkRF27jretlWqPgxhasJmI9DVDGEB
         hrDgErotK1SZ3f69OV5iJp/Ku6Zsnh+hNgUB/syoEZkTj/wImRB6vtkLHTcZWM/CrKe7
         RC6f9uhBBn7D4vVizGoABok9Z1j8U1GZPIKv/QM6T1B1tBOJR7pzcGVKkzcTq6DDmFR3
         L8cy6TQuiPiIMnEg8FeJki9MNmbnPn6EPKm8V6LiRgGYRVLgybrw5iH7slgEhPTHdu8T
         EDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779307421; x=1779912221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJFwvFMqSeGHKF7YuuKfX7SCPCAWVzw/mYZh++eDvbM=;
        b=Zp7O3XDXbW65Znd3ourLruBXZoboR3j5eR0AM4LaHEk9KxgkJ01bFC9r38klVT4gUd
         cYXvioH4yLfpbMgpxhBXr7nsJu7o5ZYWhbqoS6/uV1z+o1Zl6qM5LJD+n4ZX64zuRMLA
         oZZPkHLNf9h6UNrWpOR3WSUSq2sOmOalbSAeEO4/hzypETawNZSdqKn/NmjycsVp9Nvr
         jbU0xbwA0rXYaXrTpuhrcb1UZhzL63wps9GuqKk8gDyvWqR+aFHFoMlmCIjX/Ek54em/
         64bUFjX+2axqgwBDK8dGGiGwZ666Oxplc4si/E8ukccne35kOF/wHV6oVa0xrEZ7zMnD
         TheA==
X-Forwarded-Encrypted: i=1; AFNElJ9ce4b4VR4cJ6o7zAPqG5uC230vZkRuUHW1LbV2aO7dD1llG2AqPL2Bsoise0pLQ1utM7d6pxYFcKEx@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTn8rZpYV3XKrvF91h0jb31W/vNFeHXjLIjiW6ekBF6S80ESD
	zayrkXwHvb80iPstd5MiQxm+lzW+aJfdTlM4uSLO9bvHJ/uAKY3RIR+G
X-Gm-Gg: Acq92OFnvH2qGM3j7xVbC2dykl9t2mEkxRtwO/gtUxMGVLWX/UBnyaVLJP+qIISimzm
	tTjM62BkCgFiVE5aK7/FtArMBoMfIhE2shyYbE5mavE9Nt2UTP9bVlXQQIXEBwylIZq05bjMJSd
	b6sAxGFEHmuKF4z+9iB7zsi8qNsSxlWVXY7SMcUqM602qDwL3usGVLfmaozaiYxoSHJZxXgjfdm
	lFZJhrJCEsX/odvoqlf4jR9ucpXvFkF1vxebg3ZOIkmObi5NnVhXveb/fmVuezFbLV1s2d5g/cw
	KRthKPAIVmfuSpoZp5Q5JkM3/Yijd4/ZripbOxYZIKlWWYuyX8CmFxM6UmVPK4G8kEDSEH6/Fs0
	kVgmxsIkppK5FKhxlASlLfbL2e7Q3s3pIlLPgGpUgaJa7zXR7983YboePYBIaYqlgwKQ4lNSEAc
	yXJwJAlZGlQli8uOwqC0o58qwhJfoXJfbNJeI9Jk/HzTlGfVhebs0mY+DZasLIzACL5FM=
X-Received: by 2002:a05:622a:4d09:b0:509:2527:d789 with SMTP id d75a77b69052e-51659fde5ecmr365261451cf.6.1779307421006;
        Wed, 20 May 2026 13:03:41 -0700 (PDT)
Received: from PF5YBGDS.localdomain ([163.114.130.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516514e0b91sm188849301cf.15.2026.05.20.13.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 13:03:40 -0700 (PDT)
From: mike.marciniszyn@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: mike.marciniszyn@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 1/3] leds: trigger: netdev: Extend speeds up to 100G
Date: Wed, 20 May 2026 16:03:35 -0400
Message-ID: <20260520200337.204431-2-mike.marciniszyn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>

Add 25G, 40G, 50G, and 100G as available speeds to the netdev LED trigger.

Signed-off-by: Mike Marciniszyn (Meta) <mike.marciniszyn@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 46 ++++++++++++++++++++++++++-
 include/linux/leds.h                  |  4 +++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 12cb3311ea22..3c758a4cbaec 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -128,6 +128,22 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		    trigger_data->link_speed == SPEED_10000)
 			blink_on = true;
 
+		if (test_bit(TRIGGER_NETDEV_LINK_25000, &trigger_data->mode) &&
+		    trigger_data->link_speed == SPEED_25000)
+			blink_on = true;
+
+		if (test_bit(TRIGGER_NETDEV_LINK_40000, &trigger_data->mode) &&
+		    trigger_data->link_speed == SPEED_40000)
+			blink_on = true;
+
+		if (test_bit(TRIGGER_NETDEV_LINK_50000, &trigger_data->mode) &&
+		    trigger_data->link_speed == SPEED_50000)
+			blink_on = true;
+
+		if (test_bit(TRIGGER_NETDEV_LINK_100000, &trigger_data->mode) &&
+		    trigger_data->link_speed == SPEED_100000)
+			blink_on = true;
+
 		if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) &&
 		    trigger_data->duplex == DUPLEX_HALF)
 			blink_on = true;
@@ -337,6 +353,10 @@ static ssize_t netdev_led_attr_show(struct device *dev, char *buf,
 	case TRIGGER_NETDEV_LINK_2500:
 	case TRIGGER_NETDEV_LINK_5000:
 	case TRIGGER_NETDEV_LINK_10000:
+	case TRIGGER_NETDEV_LINK_25000:
+	case TRIGGER_NETDEV_LINK_40000:
+	case TRIGGER_NETDEV_LINK_50000:
+	case TRIGGER_NETDEV_LINK_100000:
 	case TRIGGER_NETDEV_HALF_DUPLEX:
 	case TRIGGER_NETDEV_FULL_DUPLEX:
 	case TRIGGER_NETDEV_TX:
@@ -373,6 +393,10 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	case TRIGGER_NETDEV_LINK_2500:
 	case TRIGGER_NETDEV_LINK_5000:
 	case TRIGGER_NETDEV_LINK_10000:
+	case TRIGGER_NETDEV_LINK_25000:
+	case TRIGGER_NETDEV_LINK_40000:
+	case TRIGGER_NETDEV_LINK_50000:
+	case TRIGGER_NETDEV_LINK_100000:
 	case TRIGGER_NETDEV_HALF_DUPLEX:
 	case TRIGGER_NETDEV_FULL_DUPLEX:
 	case TRIGGER_NETDEV_TX:
@@ -396,7 +420,11 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	     test_bit(TRIGGER_NETDEV_LINK_1000, &mode) ||
 	     test_bit(TRIGGER_NETDEV_LINK_2500, &mode) ||
 	     test_bit(TRIGGER_NETDEV_LINK_5000, &mode) ||
-	     test_bit(TRIGGER_NETDEV_LINK_10000, &mode)))
+	     test_bit(TRIGGER_NETDEV_LINK_10000, &mode) ||
+	     test_bit(TRIGGER_NETDEV_LINK_25000, &mode) ||
+	     test_bit(TRIGGER_NETDEV_LINK_40000, &mode) ||
+	     test_bit(TRIGGER_NETDEV_LINK_50000, &mode) ||
+	     test_bit(TRIGGER_NETDEV_LINK_100000, &mode)))
 		return -EINVAL;
 
 	cancel_delayed_work_sync(&trigger_data->work);
@@ -433,6 +461,10 @@ DEFINE_NETDEV_TRIGGER(link_1000, TRIGGER_NETDEV_LINK_1000);
 DEFINE_NETDEV_TRIGGER(link_2500, TRIGGER_NETDEV_LINK_2500);
 DEFINE_NETDEV_TRIGGER(link_5000, TRIGGER_NETDEV_LINK_5000);
 DEFINE_NETDEV_TRIGGER(link_10000, TRIGGER_NETDEV_LINK_10000);
+DEFINE_NETDEV_TRIGGER(link_25000, TRIGGER_NETDEV_LINK_25000);
+DEFINE_NETDEV_TRIGGER(link_40000, TRIGGER_NETDEV_LINK_40000);
+DEFINE_NETDEV_TRIGGER(link_50000, TRIGGER_NETDEV_LINK_50000);
+DEFINE_NETDEV_TRIGGER(link_100000, TRIGGER_NETDEV_LINK_100000);
 DEFINE_NETDEV_TRIGGER(half_duplex, TRIGGER_NETDEV_HALF_DUPLEX);
 DEFINE_NETDEV_TRIGGER(full_duplex, TRIGGER_NETDEV_FULL_DUPLEX);
 DEFINE_NETDEV_TRIGGER(tx, TRIGGER_NETDEV_TX);
@@ -521,6 +553,10 @@ static umode_t netdev_trig_link_speed_visible(struct kobject *kobj,
 		CHECK_LINK_MODE_ATTR(2500);
 		CHECK_LINK_MODE_ATTR(5000);
 		CHECK_LINK_MODE_ATTR(10000);
+		CHECK_LINK_MODE_ATTR(25000);
+		CHECK_LINK_MODE_ATTR(40000);
+		CHECK_LINK_MODE_ATTR(50000);
+		CHECK_LINK_MODE_ATTR(100000);
 	}
 
 	return 0;
@@ -533,6 +569,10 @@ static struct attribute *netdev_trig_link_speed_attrs[] = {
 	&dev_attr_link_2500.attr,
 	&dev_attr_link_5000.attr,
 	&dev_attr_link_10000.attr,
+	&dev_attr_link_25000.attr,
+	&dev_attr_link_40000.attr,
+	&dev_attr_link_50000.attr,
+	&dev_attr_link_100000.attr,
 	NULL
 };
 
@@ -668,6 +708,10 @@ static void netdev_trig_work(struct work_struct *work)
 			 test_bit(TRIGGER_NETDEV_LINK_2500, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_LINK_5000, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_LINK_10000, &trigger_data->mode) ||
+			 test_bit(TRIGGER_NETDEV_LINK_25000, &trigger_data->mode) ||
+			 test_bit(TRIGGER_NETDEV_LINK_40000, &trigger_data->mode) ||
+			 test_bit(TRIGGER_NETDEV_LINK_50000, &trigger_data->mode) ||
+			 test_bit(TRIGGER_NETDEV_LINK_100000, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &trigger_data->mode) ||
 			 test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &trigger_data->mode);
 		interval = jiffies_to_msecs(
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..bf31c246d9e2 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -607,6 +607,10 @@ enum led_trigger_netdev_modes {
 	TRIGGER_NETDEV_LINK_2500,
 	TRIGGER_NETDEV_LINK_5000,
 	TRIGGER_NETDEV_LINK_10000,
+	TRIGGER_NETDEV_LINK_25000,
+	TRIGGER_NETDEV_LINK_40000,
+	TRIGGER_NETDEV_LINK_50000,
+	TRIGGER_NETDEV_LINK_100000,
 	TRIGGER_NETDEV_HALF_DUPLEX,
 	TRIGGER_NETDEV_FULL_DUPLEX,
 	TRIGGER_NETDEV_TX,
-- 
2.43.0

