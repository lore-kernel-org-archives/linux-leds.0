Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20243E9C29
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 23:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749084; cv=none; b=TGJd5jvKf8CzIZY4azzlJhUOTyDa1JFHZDPphYz9fBLF4eL/QWi2RjmSFFu6ibLe24TwHuwG9Zb4RrKi17yPEpKVvgDnsvge/YJdKo43+mtDGK3+de/nwgOtgxHTL2VJ6Jz6Vr5EwfJPH5YLPag8iao76lueuTe0pJoUfqHT6Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749084; c=relaxed/simple;
	bh=yk1xUmsjBUNkDpcYm6K2hoMvGWCQ2/ftqNWggubTRGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+oMPCupLRVXOixsD6o7rxdG1d8kL4tazpHuE980CLRJu9qBCq8FFr6sdEakwXOx8pndaYIqOK6ZSsMNsxNGz7OdMuONcNqe0vB7fP5swRKMmRi2FxyEXEAFQc86CHT+QQ9lah/1bJ06qsHWItNEgAaLKiQKqRMfdAS+XVyn2oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkBy96o8; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkBy96o8"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1167181a12.2
        for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749080; x=1787353880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Q+ZRt0xfZjY8IftriXm6xUrwkasW7ROT4+0l7wFhn0=;
        b=NkBy96o8VmdM3F9nk/zpawjrWn+mlauI8ifjYDDN8cG2+QVmw/ZxCekMoJS0lOLxMw
         Ns3qcLph7ReMurKibZQPEOZN+KGtpWyG9+NLrByIpY1+A2Q5zHcdEHEa8unM9mVftZ2f
         9Bb1L7fMqFtFR635wtcIX+0tWPnTPwrZJYnNAl6Iy7VxBQg//kDFO2BnQh+nvx0yCN+b
         N6xb/tjzkYgkaHhVoE3OgpAfTuHDaQc0xFv4eNqZBCpyw3FJxb2uzFnDEzzzG/EzFpBA
         4k0z98priJp/j6POZlEN5AwxfchrQgQ2Rqr1MxNyzSNti+f1w7MmzjcLeQxidlgarIb1
         +oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749080; x=1787353880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Q+ZRt0xfZjY8IftriXm6xUrwkasW7ROT4+0l7wFhn0=;
        b=ghRZ89Mr+ndJ56bkZY/3njrBgYGMJsb899klk2qIdx8XMaCf97PS865ZsCnCSw2zwY
         s6N3XUFRZEcsoP2wYAOpZtp5Y/pd9LCh8OkXJnYoUZPacapl2e1wmw8DmhQz37sqAJPw
         pLviwvElrqVWe/myKR2PDZLLE50FEeH4On+2/+ijiT5hPojPiKm/TGAk5k6cPowgEx4l
         4cHeKWgHGSAr/E+yNBZgviydBxg/uXphw5t0WGvGyA0aIjcHBQwzpnTiDOInkYtVamPp
         HOaQ0TI/s6Mc8LqXcFBWYCB3ycNCKklG2eau4tkp63y7d2IovkK7GvIN55jOezFR1ox7
         Ut8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqz7V+0zd9/7uFlo+6Qu5wXotxYw6cF7JkABJDeDb2kp5I5B/TjPev5whNkJ4PCVpHL/T3a8F2nyMod@vger.kernel.org
X-Gm-Message-State: AOJu0YzzD33qEP2WfYTl41okG4FK0HjRYf7l04r3Duhjq/DH6OfNzxHJ
	/uILDt9UfwNPnfAYEktiWcOuMh8GpiL+rK56RB14xuJrGCfKUb4QuawL
X-Gm-Gg: AR+sD13PHJrhleiF2hADGkpfGjRHCwUnPSxxivqx8bxfuSvirUURCpEt4G5BFYfd4Ze
	BCe2+yD795ZZUuNotBSnQthpGKZZjR0hOgkidYMO5GeDv3v9lM+ror/OVpEjG4yNinxCzjupcUf
	OVG9BsUdJUXKAcQpFLXjLmcfnQOEkds9NAUefiLJU/qCeBaOzBMwhld1hFvHtetRQDzIs0b9ru9
	YHTpBrsolxb4wYke7I1QpsGfefrDymUP2z2W1voltF/gnSMRo6DOtoW7Ku+sy+6YAEGTDQq7KTx
	Nx1m7loBPHJh3tUZEqlXoXlNxurYQmEcEWtlL2br+Nkx0lO48tztZD51gc8Rwi0MZRuaQq0zuAD
	00bsv4So0IFH3px+HjHLMwLVwTNmY/lmne2UoqnHSlHPqeG7tfyiM2UqvnjoveTprNDe7xP8IWI
	tC24cvD8JOoaXjNRNXP2+rmivOAH2ysuQRcXwGMNGXoDxQIil0kW3YZik8A9LVMBDXZzE5a/VUr
	OhufR88lSQ=
X-Received: by 2002:a05:6a20:12c8:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3cc71eb2586mr9668252637.37.1786749080088;
        Fri, 14 Aug 2026 16:11:20 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm8563607eec.11.2026.08.14.16.11.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 16:11:19 -0700 (PDT)
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
Subject: [PATCH net-next v5 4/7] ptp: ocp: Track EEPROM fields independently
Date: Fri, 14 Aug 2026 16:10:52 -0700
Message-ID: <3186cc1f1c51b548439fda558e9e4052a481b787.1786747084.git.ahmadexp@gmail.com>
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

The board ID and serial number can reside in separate EEPROM devices.
Requiring both reads to succeed before publishing either field makes a
missing serial EEPROM block board profile selection and hides an otherwise
valid board ID.

Serialize EEPROM discovery, read each field into temporary storage, and
publish its readiness only after a successful read. Let devlink report
whichever fields are available and make the serial-number sysfs attribute
propagate read failures.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 129 ++++++++++++++++++++++++++++++------------
 1 file changed, 93 insertions(+), 36 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3d26ec1f7b9e..31a4c9dfe391 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -21,6 +21,7 @@
 #include <net/devlink.h>
 #include <linux/i2c.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/crc16.h>
 #include <linux/dpll.h>
@@ -343,6 +344,10 @@ struct ptp_ocp_serial_port {
 
 #define OCP_BOARD_ID_LEN		13
 #define OCP_SERIAL_LEN			6
+#define OCP_EEPROM_BOARD_ID		BIT(0)
+#define OCP_EEPROM_SERIAL		BIT(1)
+#define OCP_EEPROM_ALL			(OCP_EEPROM_BOARD_ID | \
+					 OCP_EEPROM_SERIAL)
 #define OCP_SMA_NUM			4
 #define OCP_SIGNAL_NUM			4
 #define OCP_FREQ_NUM			4
@@ -403,7 +408,10 @@ struct ptp_ocp {
 	u16			fw_version;
 	u8			board_id[OCP_BOARD_ID_LEN];
 	u8			serial[OCP_SERIAL_LEN];
-	bool			has_eeprom_data;
+	struct mutex		eeprom_lock; /* Serializes EEPROM discovery. */
+	bool			has_board_id;
+	bool			has_serial;
+	bool			eeprom_error_reported;
 	u32			pps_req_map;
 	int			flash_start;
 	u32			utc_tai_offset;
@@ -1969,21 +1977,50 @@ ptp_ocp_nvmem_device_put(struct nvmem_device **nvmemp)
 	*nvmemp = NULL;
 }
 
-static void
-ptp_ocp_read_eeprom(struct ptp_ocp *bp)
+static int
+ptp_ocp_read_eeprom(struct ptp_ocp *bp, unsigned int fields)
 {
 	const struct ptp_ocp_eeprom_map *map;
 	struct nvmem_device *nvmem;
+	u8 data[OCP_BOARD_ID_LEN];
+	const char *field_name = "data";
 	const void *tag;
-	int ret;
-
-	if (!bp->i2c_ctrl)
-		return;
+	unsigned int field;
+	int ret = 0;
 
 	tag = NULL;
 	nvmem = NULL;
+	mutex_lock(&bp->eeprom_lock);
+	fields &= OCP_EEPROM_ALL;
+	if (bp->has_board_id)
+		fields &= ~OCP_EEPROM_BOARD_ID;
+	if (bp->has_serial)
+		fields &= ~OCP_EEPROM_SERIAL;
+	if (!fields)
+		goto out;
+	if (!bp->i2c_ctrl || !bp->eeprom_map) {
+		ret = -ENODEV;
+		goto out;
+	}
 
 	for (map = bp->eeprom_map; map->len; map++) {
+		if (map->bp_offset == offsetof(struct ptp_ocp, board_id)) {
+			field = OCP_EEPROM_BOARD_ID;
+			field_name = "board ID";
+			if (bp->has_board_id)
+				continue;
+		} else if (map->bp_offset == offsetof(struct ptp_ocp, serial)) {
+			field = OCP_EEPROM_SERIAL;
+			field_name = "serial number";
+			if (bp->has_serial)
+				continue;
+		} else {
+			continue;
+		}
+
+		if (!(fields & field))
+			continue;
+
 		if (map->tag != tag) {
 			tag = map->tag;
 			ptp_ocp_nvmem_device_put(&nvmem);
@@ -1992,24 +2029,34 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
 			nvmem = ptp_ocp_nvmem_device_get(bp, tag);
 			if (IS_ERR(nvmem)) {
 				ret = PTR_ERR(nvmem);
-				goto fail;
+				goto out;
 			}
 		}
-		ret = nvmem_device_read(nvmem, map->off, map->len,
-					BP_MAP_ENTRY_ADDR(bp, map));
-		if (ret != map->len)
-			goto fail;
+		ret = nvmem_device_read(nvmem, map->off, map->len, data);
+		if (ret < 0)
+			goto out;
+
+		memcpy(BP_MAP_ENTRY_ADDR(bp, map), data, map->len);
+		if (field == OCP_EEPROM_BOARD_ID) {
+			/* Publish the field before marking it ready. */
+			smp_store_release(&bp->has_board_id, true);
+		} else {
+			/* Publish the field before marking it ready. */
+			smp_store_release(&bp->has_serial, true);
+		}
 	}
 
-	bp->has_eeprom_data = true;
+	ret = 0;
 
 out:
+	if (ret && ret != -EPROBE_DEFER && !bp->eeprom_error_reported) {
+		dev_err(&bp->pdev->dev, "failed to read EEPROM %s: %pe\n",
+			field_name, ERR_PTR(ret));
+		bp->eeprom_error_reported = true;
+	}
 	ptp_ocp_nvmem_device_put(&nvmem);
-	return;
-
-fail:
-	dev_err(&bp->pdev->dev, "could not read eeprom: %d\n", ret);
-	goto out;
+	mutex_unlock(&bp->eeprom_lock);
+	return ret;
 }
 
 static struct device *
@@ -2156,6 +2203,7 @@ ptp_ocp_devlink_info_get(struct devlink *devlink, struct devlink_info_req *req,
 			 struct netlink_ext_ack *extack)
 {
 	struct ptp_ocp *bp = devlink_priv(devlink);
+	const char *board_id_key = DEVLINK_INFO_VERSION_GENERIC_BOARD_ID;
 	const char *fw_image;
 	char buf[32];
 	int err;
@@ -2166,24 +2214,24 @@ ptp_ocp_devlink_info_get(struct devlink *devlink, struct devlink_info_req *req,
 	if (err)
 		return err;
 
-	if (!bp->has_eeprom_data) {
-		ptp_ocp_read_eeprom(bp);
-		if (!bp->has_eeprom_data)
-			return 0;
-	}
+	ptp_ocp_read_eeprom(bp, OCP_EEPROM_ALL);
 
-	sprintf(buf, "%pM", bp->serial);
-	err = devlink_info_serial_number_put(req, buf);
-	if (err)
-		return err;
+	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
+	if (smp_load_acquire(&bp->has_serial)) {
+		sprintf(buf, "%pM", bp->serial);
+		err = devlink_info_serial_number_put(req, buf);
+		if (err)
+			return err;
+	}
 
-	snprintf(buf, sizeof(buf), "%.*s", OCP_BOARD_ID_LEN,
-		 (const char *)bp->board_id);
-	err = devlink_info_version_fixed_put(req,
-			DEVLINK_INFO_VERSION_GENERIC_BOARD_ID,
-			buf);
-	if (err)
-		return err;
+	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
+	if (smp_load_acquire(&bp->has_board_id)) {
+		snprintf(buf, sizeof(buf), "%.*s", OCP_BOARD_ID_LEN,
+			 (const char *)bp->board_id);
+		err = devlink_info_version_fixed_put(req, board_id_key, buf);
+		if (err)
+			return err;
+	}
 
 	return 0;
 }
@@ -3757,9 +3805,17 @@ static ssize_t
 serialnum_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct ptp_ocp *bp = dev_get_drvdata(dev);
+	int ret;
 
-	if (!bp->has_eeprom_data)
-		ptp_ocp_read_eeprom(bp);
+	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
+	if (!smp_load_acquire(&bp->has_serial)) {
+		ret = ptp_ocp_read_eeprom(bp, OCP_EEPROM_SERIAL);
+		if (ret)
+			return ret;
+		/* Pairs with field publication in ptp_ocp_read_eeprom(). */
+		if (!smp_load_acquire(&bp->has_serial))
+			return -ENODATA;
+	}
 
 	return sysfs_emit(buf, "%pM\n", bp->serial);
 }
@@ -4729,6 +4785,7 @@ ptp_ocp_device_init(struct ptp_ocp *bp, struct pci_dev *pdev)
 
 	bp->ptp_info = ptp_ocp_clock_info;
 	spin_lock_init(&bp->lock);
+	mutex_init(&bp->eeprom_lock);
 
 	for (i = 0; i < __PORT_COUNT; i++)
 		bp->port[i].line = -1;
-- 
2.50.1 (Apple Git-155)

