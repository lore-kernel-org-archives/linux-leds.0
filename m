Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467868;
	b=Z5gSTsss5hbeoi7VGcpkZYsPf15VyewiEwLc5uLMnXs8KIWAVKbur1ElAVQdU/5hyJIf
	 mcZq+BWuxUY0e0q63ONgV8pnW1zAQ4qAVkcioSda1KgAlcFdtF0Qz9LAn76JZtMGo/AD8
	 3aw2H77tbuOW9jY5fI9uEaWtlLzexYcd3mnQDNDMsDswatOJ0aeYC1bivYBHevXZ3zMeg
	 GTu5U3Y34adsw/6rAzNI7dVnomW1FVcycIYhhkJyR34iAvdZyZBwr4IwYqp798ta8+sKn
	 eke0ywWQPmlAAyAc1egnv3Dta/vptsJMrTTBauj4Y/TXo831Govq+X/XgrKf0KGGNFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467868;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uJA7Wh7hk5jvffnQvL6OPz2cDEhFA17BQBL1FxXlBmo=;
	b=2EL3tSrDUR3FJztzAuO/mKAWyttxXrC0z0/d3X/DP8K3sgGxUt/mfM/Lb6imuGZxCIUX
	 GjteVfMX6Inau1fIl562iTk1ttv8xKeLfzhBe1flTcMQZfHwrnlHtB5xT+g2jXRAKMwrR
	 YZLNpxZQkekB933LLz3YGhsOKNyeCtndd8XckqXGAoMtuYNch2CdOvjn4KL+tGvoChhvy
	 vdJNArOD64LSo54XS6A2vSys0N1eyNLJHwdCY8cx3xZU3YSvAyY482k3mr5zKdiFrTjL1
	 3JZSnzYWns5Mzdw0ifKOxFmYYonMC2iOxF9YOIkYyARGOL01jb34wu1c5PEsXOwH+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZJVtCjQf;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AED9606A32E;
	Thu, 12 Nov 2026 07:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AED9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZJVtCjQf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZJVtCjQfx2AfhZCphb5rHtRSdX/cGo+J3TRpQ9M27tDxpw9Kod0uMgwGKGB7Jb+wesMNzTIkzkMZI
	 Bq2z5pgrILTuOuStFuL7C0Iy4Q2kY5O52UiOZfnpbAJnh4QUpOkWVByQ57mPNLzwprjqBrilhCFaLH
	 +K2Z4H9GIsWRyOvM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af5680ee57-7f0da;
	Thu, 12 Nov 2026 15:17:34 +0800 (CST)
X-RM-TRANSID:2ee86af5680ee57-7f0da
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af5680c91a-f6d45;
	Thu, 12 Nov 2026 15:17:33 +0800 (CST)
X-RM-TRANSID:2ee76af5680c91a-f6d45
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	griffin@kroah.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] leds: pca963x: Preserve SMBus errors in power management callbacks
Date: Thu, 12 Nov 2026 15:17:32 +0800
Message-ID: <20261112071732.154585-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The suspend and resume callbacks store an SMBus read result in u8,
discarding negative error codes, and then write the resulting value
back to MODE1. They also ignore errors from that write. A failed read
can therefore overwrite unrelated mode bits with an error-derived value.

Keep the read result in an int, stop on a read error and return the
write result to the PM core.

Fixes: 46f02b681ba2 ("leds: pca963x: Add support for suspend and resume")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/leds/leds-pca963x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index fa1721916963..80396f19767a 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -481,25 +481,25 @@ static int pca963x_register_leds(struct i2c_client *client,
 static int pca963x_suspend(struct device *dev)
 {
 	struct pca963x *chip = dev_get_drvdata(dev);
-	u8 reg;
+	int reg;
 
 	reg = i2c_smbus_read_byte_data(chip->client, PCA963X_MODE1);
+	if (reg < 0)
+		return reg;
 	reg = reg | BIT(PCA963X_MODE1_SLEEP);
-	i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
-
-	return 0;
+	return i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
 }
 
 static int pca963x_resume(struct device *dev)
 {
 	struct pca963x *chip = dev_get_drvdata(dev);
-	u8 reg;
+	int reg;
 
 	reg = i2c_smbus_read_byte_data(chip->client, PCA963X_MODE1);
+	if (reg < 0)
+		return reg;
 	reg = reg & ~BIT(PCA963X_MODE1_SLEEP);
-	i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
-
-	return 0;
+	return i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(pca963x_pm, pca963x_suspend, pca963x_resume);
-- 
2.51.0



