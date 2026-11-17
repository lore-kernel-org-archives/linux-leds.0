Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915882;
	b=QXxsGTByc8BC1j708qrmpc+hS8H3htucdrZkHuV9eUqMdcWz4JIwyCNarxLJXYDCXKnN
	 K1LgP2vtc6y4RZFG0NsPxQgxUddFMohRsKqG4WgYB4KlNN8EWqxqih15zoOb/MrASslQT
	 yQ82HTIO/VC4K4SfTVDK/nt5grjivzjtVooQgexvqP9xgERIx+wRcwWQefLGWwLJuHXcT
	 RAKJVt9NRigrhjBAosRb4EKMVt6LJIMkO+gOLQNhE0tN3o2AAhMCV8XXxr6/vp42AOsl0
	 LqRe6aKIn0KXmBBDBB9ipsnnj1R7HFVoCGg3JgoKefVrEQQyzD0cT9HCe8If1hHlWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
	b=etLmGlFgpB1223X0RfjSR/DlCI6i8XPT0jpXyqW+wfLda2lonfo57Hw2OdugnESKn6/7
	 cmeHe0BET/beXe3MrX/5vuee03RNKvosPhWqjL4HKKHDxpT2+mhALA8ox0Xc/srKtErhj
	 xhA2JwylZXlv2swtRzwpJJsGyzsnU4SvPmHAgyJfTqycuuUZK1Pl5iMZgYx3PFzYFUIyZ
	 KACE7bPzGo5Q0001l+9XQzHtkwecNw8C/VBmXIgOMWaUS0pqnQTl08vHJfCw9HxQ3MVKQ
	 l4+Z5hejHqASWNf8WIscyYT7mg80hjX3qbUy0YIoyHXc3YpzRlt4ruG45T7TNYR6Vmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1E606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so3933744e87.2
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915881; x=1795520681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=sl6D8KA3FdArmPRJE/9/3+w04VGmJDoM2kpUiE3bxNH3r6gjXuJ31wqpbPJm8xLQSP
         ReziKQZ/ww36NUUjGiK9BugbjFwhJGiKbpgb3teYqK1i/JL/DWtLuselX4Cktw4IsSzn
         BbS+lxVRb75D57P+c+oDj1oeo9TBDnsDy0dYgEs+bZBkveiGTIAT+dh9oDpb/3ydcdlp
         RcQGXATiDmRYmyANYlJNcW3h36Y2lZ/W2oQxqsSRJNQ4mh6d9h1jUgkLydLKZFO2Jw6y
         65VBX951hp9eNUwdUNBY0ktRDQ0mqSVT/Hel2uek/GoRydpA0ZdH5+mf9tHsdQhnKko8
         jJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915881; x=1795520681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=SnL/7ZEsslZqbLrPPYMj5Qaob7eQ3ve6rzuPo4mnTkMu0Jp1uqp62fDYhggCbDgMV/
         t28nWfzPdrrJZlvDWCAX8bsPuetOcYxabGbcn1AHNaXdJ3G01/xGRnpMcqF0UMG90AoN
         Uie84Sxh+mr87FqdVj3l2126RiyRDquC+GVBGilXRQPe6MxdXhV+QpnOo8TBJE+zP9V+
         L9ALyGtNjCxmqQwO1aQvbreLpj4c5Cix0sH7NaD3dWwoIvKl3iJALeYI9u2TsWiq94hE
         mEDHrwTusCKwfYuNzWyyFCnnK3VCFj04JVOeLQPAKCMaCvxW57Vw4gYl+7gyr48SvRdB
         BgVA==
X-Forwarded-Encrypted: i=1; AL+hErEoyyo9CR35JtdymbdFs3SmD0KgdPAjqS+EDoT81hXQhXJotWakeVFBcaWDjdpylQTJLjlyXvGNIOK9@vger.kernel.org
X-Gm-Message-State: APuU4Z/8ZRkNBaXtLLugozhXQ7FpFvqr/IdrJ1QLrLDQExtuGp/NQ1/G
	oDV3sVRCwl6ClohTIIzbP+mE84gflDqjBaiNjZmWpzn/AqJLURxfbia0
X-Gm-Gg: AYBFou3izYBgBcZmKIVka8L6wkwDAGoCeCmFLxe7fLUTVKGsFgBXz1oBybOuLwqaGkD
	2L/ZGQ6Ec24N7moXar5oTndhflK4T/9aUijxsRxvBmalwZv+HKzZAQ3b+ifwIdaR/RI95mG/OJh
	fmmpPA6zxyZ5DClzuEwD8qAQPdeqwthYdZ9+H7u4JBKoZRqQHB3DSj7d+HCp3cTUpbwigfiIgij
	E1CzhHrfsZ+lH9Ue8va3RbSjn0433wExxl/KxDG4VmIc4CBEO0cTK9lWL+mVnsgXbSOt+xibQGr
	WBN71IpdEIIlgk4uWyth+LhKrxrRcOofBY+S5R4mQjOzxbiLrp5Zmh5BAifLpvncL9PlGMF0k/P
	+hS+P7JmlXE8iWKxbWvZQ0RdMhuQWAzZrL680s8cAAlagRPH404gYBmpq0/SpV+fZfzlirHsq5W
	1RDmuRrUGmXGFNaBYTDJsSMPOUvTKzt+Sw49oIwXXMOOvU2d50Ziq8ZjdH2NetrBJ6AnxsInfh1
	zTfBjI4Nf/wiP+vNOvWLz42Kp9hWvC9OtoXIU6p3OjIRkDY0PH6DT6cRS+n0RipUrZ1t7PTY+Bb
	jNws5JFAbHcZeS6Z6UZ6tiPU+OA8tvFWJ770FCDif49aH+c=
X-Received: by 2002:a05:6512:2246:b0:5c1:56f5:fabc with SMTP id 2adb3069b0e04-5c1709b2313mr5888936e87.24.1794915880522;
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 17 Nov 2026 14:44:27 +0300
Message-ID: <20261117114432.2794961-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

