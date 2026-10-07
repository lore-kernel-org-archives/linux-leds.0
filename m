Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECE74582E0
	for <linux-leds@vger.kernel.org>; Wed,  7 Oct 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363320; cv=none; b=IOlBgbud2NTJ5ud+LCGg6ipwyM69xGqpsnEDdKenP/OsQNEz51l/dC0ouM4DfqWSOXf70kxQb+CjDXHELXsWgqjJ0mRXaXEgRt9AVsBFPVn0rOZYUg3td85g6720IgWnrjH+gpdpUmtEGgGz9IX6alx5R/hPSXkrqXITUo0YNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363320; c=relaxed/simple;
	bh=mPskxgPYuAfFCQnnk7Iss6E+WGp/8ax+HTOK+Gc69q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgX8cYOt9ienCY1aVUTjlcb1zJlrBDE4DprOY3yBTQbSNPcIZDN6qr7/pDylMqxOJdjcYqEhiA3jbWd5GsROpmfCOl4gifjL2hfD/o2Re4slXl6a3YSZ562RjfVCyI/qDK0cfjJhXatyj+ZR1tAqy+cbGNJpnL+7mHgqIEwpGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRksqhwZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRksqhwZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b060ec084so1096357f8f.0
        for <linux-leds@vger.kernel.org>; Wed, 07 Oct 2026 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363318; x=1791968118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jterHqkHpEJwSt6BwIj0mPjeE25maw/i/K8J/m2dFZA=;
        b=gRksqhwZoSaM2tItOMQpnup+rLuQRgKtui6OWtZiht0A6lhlOpdFsvFODijpYrPmbq
         H2ISNGmjZ41kym3vX0HD1aAKAakmW0fjJCyX1h4EWY3Of7gRdlzib8QTHgov179HdRfX
         OHEvboFtaLpjaoF4F+IB0uhWY2F8C4/J3aSLYU8/KOtJAvtFoA+dy68ahs6RI2+ZKDRf
         dRQNH2g5+WBP34DjCK2ZEpG1M3tKvAESvoOYNtiL1k2ES/cNavi/RLwsHdcKgH3c217s
         OgAEPX+pVbz9JDXJgSjqITBWRZ3G/ZQc/PMPi7JbUxfTNE2fR1wLN5HahoDuVQP7OUyl
         aYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363318; x=1791968118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jterHqkHpEJwSt6BwIj0mPjeE25maw/i/K8J/m2dFZA=;
        b=fHQqPZPHln7/p983STWq23tN5IReGsi1G9WAfAvVa+JuBJszS5RizHPm34sLcGs8DY
         Jq6PCpbsCFXqfwpW+L8aEqNq/mfwJr+MrLFsFDJfLoLKfQlvcqwvKZWjBWbpw5dFNacw
         XD8/ipa/x/jmbBTgO1N5nE9Ai5AuW3mwxKaPsD4/EcvhJPHZh3w/TiF9L/4e+ZVUY9R+
         tQOIc2DE7B3/3L2igSIk6/YrMM2HvPZfDErSx/e3HzXGeYNR/NsC/l2BfbmpHJJBCzj7
         rFlEGQMJbfCs7zAa9Q/OHXyaQslLiY5Nqt4Up0x7YbptTqejNjaOI2NErk3brsYGNhKE
         HWzg==
X-Gm-Message-State: AFuF++mErME/SlLJIu1sAeINLp/4/y6J/TmJiqRNdXLowJiHcsTg1GDF
	MqOsWPPHZ/WgaBTgfgu7PSTavwAkuYbrPM0caZxeYfVctjMj/iuj6kWQ
X-Gm-Gg: AYBFou0Rq5uy1G3pENV05UPRsTQRUI/OLm6Kw43spNoLQyDCvDQl0+5rAAnMsTLrQKK
	1h0CJOPV51fCF7DG+Qm0+IfglhkE6qooxoHBu5tuKv5KaT5JTOkKkNS5PzKjYQxj342kWdFzmqS
	bV0P3GAbjnriUTIqqAM6dYU/GsVm42Srgp0NRxF4AVa+5itMms5TtByxPjCXn/YDIi8xNKH4qH9
	rqjcta6IO3O0brWTAp6d/sKI4m+2Oo1twzmPyY+t2RxoBUhP9a9xlYmmMWhYi6zApKinJ+X22n0
	/GudBHmDVttllP+QfTR5AwVYnoxB/6oaZ/hX3DfYJiiTgDMc+nTEomuFndVYt2wrATCGpXagnNt
	ML6QiQKfGIX+gLhvs0+rjmfKsoN2NIoNK6TPdVROQ9aIEkH4zUIpNOGHCzbwdIs5BhF+q+tOdGR
	zRD5k1I6wGIOegtjwVo82yJgijaXruIKstNiqD6ouDEserTZKabX7cSifJJwNaIz7qt2aaeXc9U
	AZrxte60l2Yk1aDvYA=
X-Received: by 2002:a05:600c:3b86:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18043c2a2mr27179375e9.24.1791363317558;
        Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current Regulator for Flash LEDs
Date: Wed,  7 Oct 2026 11:54:55 +0300
Message-ID: <20261007085457.98762-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007085457.98762-1-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT1270 Current Regulator for Flash LEDs has a similar configuration
to the AAT1290, but it uses a different programming model and requires a
separate compatible.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 65576dfdca110..a65d92522c9cf 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: skyworks,aat1290
+    enum:
+      - skyworks,aat1290
+      - skyworks,aat1270
 
   enset-gpios:
     maxItems: 1
-- 
2.53.0

