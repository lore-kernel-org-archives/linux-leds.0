Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7694DE701
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781654; cv=none; b=kjc/6UiMtxSDHg6amJf8J0a6EucQiUy5EeTGqzPcGOS//mim2eQun5mFZoxBsN00FDf4dt00L0TFqE3YpmVmqBb5y3raYx22FZnVAHnk8BZta8XzSMcmoV1wqgH30N+BQkbPEDEuplJpVEAmo7/H53pinxQ1WKqo1SUMaxL5rpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781654; c=relaxed/simple;
	bh=F4DOlzrHJ5Noxh2e84GcCJe5cJl1nVX0t0cPGeZkN0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gCkpghJJsVplfb8cr9KPfsYkI+iU/9D5v4UjW5Q6EDJY09QXqgNE+kWDdebeC8WyU69wWNTBn36ZG8995Cf3nWASlX4phfnsgwS1N5mfM7f5TJCmQK2v2EzxinaC5qkyOOR72QdGWh/SZELbz6aY5iNUm5JX9U03MBHNuCcx8sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=JJPqAn58; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ktbriZ4U; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="JJPqAn58";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ktbriZ4U"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 401151D006A7;
	Wed, 30 Sep 2026 11:20:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 30 Sep 2026 11:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1790781646; x=1790868046; bh=7S
	K9o3JG7d9/VdHeZN5mVEVEqGphlzzK3n+QsyG/luo=; b=JJPqAn58N1cfPoZPra
	2G1/AHQI2+AnjN7qJfGCbwuqxHFH/Mlf2vcCfuk1wowLYHiAqo7aujoHIoA0G30d
	lWpImMn+4i/ztmjalkLgL6Bc7RdfD1zNH2oDVcpx7kBn3Q6JGr2jfMqBv8BSxuTR
	sqQ7auB2ahRcdPppA58z1TaeKNV01ar+XTmpsFF9j5HNRiI5MaF3PAFx06cirlMH
	mqJq71jS10Z1m+7cvU2XA+s0RTGLMrUrROD7VDLwNxlOJVKVR9c1B7guHB8/+rJd
	DBipnHYYHztNxBdrAXGXxu/BrNOPbyw6XJIqc2nbLi6c8Aw0cuZZu0ai0FBRDyl8
	a9zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1790781646; x=1790868046; bh=7SK9o3JG7d9/VdHeZN5mVEVEqGph
	lzzK3n+QsyG/luo=; b=ktbriZ4UFsWrCnK5TScxxGhqViqkPogS4YQ3/28hh7aq
	d9RPNRuWmdamoYjT4oF78JoFpCMRFVgksZIyPB/tlZpzjnfHNexH3JLB2A9n6SDO
	JOL/MlZIBAilEsv0Ny6uJZTN+o7ym0Af4StIQ/QB4jsth9lJYW3R+keKtAUgpbSm
	3XrMRcO60qcu1455gsjri1CdnzmKvGv4tY4J5XBWGxU1q7H3g+NG/nuE/UAT+er3
	0+i5be9MjfucQ/HJtvC92ICxxys4arba1dUGnkcK8nYiwfGsJBjgyRfJ23KQzf7E
	tngcybfBbW7zPQJs+S1kmsS9xia+Mz6WSYTjFIPvTw==
X-ME-Sender: <xms:zii9aunYvd5iGUZ3ytI-aVXbEblaFmzKYIdJRcUrmH-scDpwAm8kvg>
    <xme:zii9as1xsc91YqoWwlyD2jCIkmA2cWGrd041fcm3sCa_oeaiLA4IqFuCyjrI7Xg5T
    vvckmZInU4NK5iE_GyDEepD-wq-vAUFyOyylFRDlWV_YNw1IkI>
X-ME-Received: <xmr:zii9ahqwsff3mVXFepsEhLX0DRy3lTlCyC4mT7anfrIii2WTY1bEbj7d9e3PFWN616F3UiOlS821Phuou6aGWWwHEju8H2_sXWXB>
X-ME-Proxy-Cause: dmFkZTE2EHFg2943HWFNKKSj/ksTwsa9gk6/XorljKYppycUozyVl6VJtov/Qxxqnywmhb
    epcVH0+PL+s2u7WXAU6kqPUEPdFLHrT5cJ1AJdZuNywQquao3LWC364FfaPPgeiR/94hyc
    R318LNxNcv6ce8QtNc26k7zCLHTYcRB2bsuXqwnIpE+xQka5veynK49309ofp2IQBegdSZ
    xdFg4NZjUe9iS4l1TRmnP9hv6wgsfnhuQroTkS1T/PFOQ75I8bUi8cxmOrNI7U+BCdVVY3
    LHg9n7tTUeawC6mwrNBOtP8Qu9U+3sXtvf2l+wfdh7LeCdhmrpam3ElDMXlsFkeYszFKUV
    axzeRjpQCkFKlDaZmqkgPTZBCv8xac3ujcd0QtR0MvDU0DlTCjGMM7Nmc7e519DOtHkpX5
    u/7Sn5EQGfSsmcHLR+eW7u/GZSn8jMa5ufvYtHnExlytJ9dV2DWP/0LCCmiunKTPT5QcWy
    spYwPZojwj10xZyKDyjL9vjxm0zEQHjDzvb6wLf2O/KxDvrpxlHwbNOBDbwRKCKpMsy+4+
    tJumyZnbsPjCCj4yk+oXBFLb6mTe1xQ5CrtK6tR5LGCcJ9M3Hx5KYZc25Ly+St6N7EKJqp
    bcTG+VKpBxlf4vOQ7BCdYIME7I3vMBF6128+4EMsZFhl712SqgrC7vD8DsEA
X-ME-Proxy: <xmx:zii9ahdl99fTs3FKyXbac9e3U0RpGdPPqyII7mqhmpaB5F0Mp5Ezvw>
    <xmx:zii9aorqnQmLL_INrezLK5hMTpt4LTFm4kPgy4xIvlx-rg8jFHr79A>
    <xmx:zii9aqEmwyrk71KQDsxDcYJsZfdCBYNBrO398HgT2DCmtHFNGdYm3Q>
    <xmx:zii9agssI0wLpKnAsbc4kZLIJZSB3QcREBzb7MtfV0MSfh-ow3BdwQ>
    <xmx:zii9as4vddstaTobdqmCqXk7F_Kwj1uUojp_kuR7VRYkaB-JyKoBfXbv>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 11:20:45 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Wed, 30 Sep 2026 17:20:26 +0200
Subject: [PATCH] MAINTAINERS: Add myself as a LED SUBSYSTEM reviewer
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-led-add-maintainers-v1-1-ebd45f8b6ab1@kroah.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche3aTpQYIvorx0NIB1mg1XTQmh
 Hen6mEO32H+lQxZYXSqVsp4q+kjFdSHiobZpwmssZicuFb6o/ANkX2MfPealjJkY+lqBDf20ki
 g8nxmjPr5Vc+Xv+0VrhiWb4q2bQeVT98RdwAAAA==
X-Change-ID: 20260930-led-add-maintainers-071eb2f9050b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790781645; l=762;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=F4DOlzrHJ5Noxh2e84GcCJe5cJl1nVX0t0cPGeZkN0s=;
 b=x0OE2Tk4wfy7KE9Ke8PCFbgYF2FqyZIyyhpTVar/Lz9JhuxU2qL1zD/PkBYdfard+4e/q2S/U
 /ChTKzSsGxwBfkrTdm72NSNMnGf797vxOCCs7/GoATpL5hmAuLAKguV
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

I will be helping to review LED patches.

Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 360977678f70..707e45c64b0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14781,6 +14781,7 @@ F:	drivers/scsi/leapraid/
 LED SUBSYSTEM
 M:	Lee Jones <lee@kernel.org>
 M:	Pavel Machek <pavel@kernel.org>
+R:	Griffin Kroah-Hartman <griffin@kroah.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git

---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20260930-led-add-maintainers-071eb2f9050b

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

