Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429094C4F7F;
	Sun, 18 Oct 2026 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331642; cv=none; b=c6JOjZb9trCnYlanDDEmSlLp4ppjeQpnjBtLnYzstmbPEr6gO/8QpXvIIkj5xY+vCB2q0kkHbHEjh9QHjO1w2g+I8irolkEmAF2hObpRXWU995UTE5vQvt1pEfrii4h9Dtj3+3yVjXgB3fGGiVCQmpRK7jmDt46w7s1Ib0Hi3qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331642; c=relaxed/simple;
	bh=eBMElev1FAZumq6w2ynxrW5lhwydfHFZGIsTKqDY2CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAhbEYJNWQ3c4FbTTGmMyid7MDBt9cm+3Tvrj+zQzcgPwgShi7UFO85H/9zWgrXqoPrr+iaEYwE/LDDIwmJXsRhkw78bRtUVxmQzSyOTI0UN/nC6NMpr9ztYYTJYuxjb+RwqMDaQ+mg9Cmd6VvHjK/VcnTvOD+nNnCi/FIo7YwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rCpakt6D; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rCpakt6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331639; x=1792936439; i=w_armin@gmx.de;
	bh=wSlRDUIMW98TGsHiM55u4/NRnQn4Io9cJE9ijCkRk44=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rCpakt6DQQHPIFKDKDgPcn8yLC5jyD3pn7EjNSYxXZNHCGwpEWTi86fFIHHpbn4o
	 4qyHoj/i5mRX7cLlui5k4CFDTJiueAkOGgpx9/vjKRuUm4UPo6YQm2tfCT+b33QXb
	 c/b3kj9XWZ124hFpIKysY0CLeX35+g9im6zCV7veDc46czHfLG5yuGfJf7+ZSCxMu
	 onGLVgIxqJQTkkroSqaXiKn8LNb1DiKJf5mxBlFHaghmxUIG7IOnZXDnQPdLKq5sW
	 bpJTqG1Zy1hp2Am4OOT8E9ACFU9uDrd1mWc1Ff40mMS6Sw5XwCXYctYAzErMi2/Co
	 maEA3fz0SPChW1Q0Lw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhQC-1wmS5T0umq-00cDg7; Sun, 18
 Oct 2026 15:53:59 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] leds: class: Use correct type for brightness_hw_changed field
Date: Sun, 18 Oct 2026 15:46:26 +0200
Message-ID: <20261018135339.1109271-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018135339.1109271-1-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8hJKo4oLi6n9YdntBXtoKTpn3dmGX9Yq2M7seKPOLXPwg3mOFjV
 ir8CUZqSWSErOQXeadNrShvzH1JzDIl9QQApe8T+FqimoReKMFTpZRBAODUJQAALxSb3O1x
 yUqAEJ50gaBip0danGdb6tcNFs6OcBJmvx8WlsVlER16F+s9bei7kF1E1cj48fTY+nHBKS/
 H2qA+gr7o8MaoLBWm9AaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4noqmHgjwVY=;xKTkOUltdNMpHckxH3e7gwvDLEQ
 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

Device drivers can supply a unsigned integer using
led_classdev_notify_brightness_hw_changed(), but the associated
field can only store signed integers, leading to issues for very
large brightness values.

Fix this by using the correct type for the brightness_hw_changed
field.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 include/linux/leds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6f975078cc14..a057ae623d5a 100644
=2D-- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -235,7 +235,7 @@ struct led_classdev {
 #endif
=20
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-	int			 brightness_hw_changed;
+	unsigned int		brightness_hw_changed;
 #endif
=20
 #ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
=2D-=20
2.56.0

