Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BDC46F481;
	Tue, 15 Sep 2026 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479928; cv=none; b=pwDswG5GKMgcQKmoGrNnQ7vPwH2jy28sMHMUIB8bi1LHmPxHrqT3+p1Xk+75FtfccMp6iRhOuCfhltdFSvkwScZ1Dx2rctGmY6uc4AlKw9CyBSrnhA4XTyYOzzSId9WVrnrWmYGYgfo2CJWaUIDCBO/nRIS3XhtMnwVZ6jdB2mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479928; c=relaxed/simple;
	bh=kGv1/ML+i9iJQ736DOf5VDzTAeG82e8j/9d0X1H5qPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHmtJT+1gGQ4RHmIYcTXI/8tdi6u0FdoLWQiyW4aljkIfC8M9chQhvQbyPMlHxm9ysfp6mtHTo33pE5azY8DVW8AE7CDOsz1D/FopgFt0phX0dVYirgTmElxokNYlKVDZi/961vqdPsqNzlMsRv9OBJTBmNsySBA5bHX2UC81kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CIs21g66; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CIs21g66"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Zer2yRUar9EakDrw6r8hGxxftGpTkKfPRHqpMEPkxdc=; b=CIs21g66UZbNP2oceLwHCHyfnf
	bPmydInf4yE05R8hBG47rju7g5OcksLfD+RfUzljPWPbRFXi0DrKTiUMNvCAMsnTvvAhQJhLxuKXR
	rsfCsW+myKreDUFhP9tM3ZTbzLukx4m8Cz5+CrFWcYHJFRoEObdI8tBd2/b3saFc9d73d1qZ9vDMM
	ASAdpA/wRwiQ4U7RRHYkSUAG1UJBYaoQnWiC4P4/y/oxEMfw5wxuG196nltfgzZmCeDm2YCDA7Ina
	nYBDsXxeHo1k5YU/08/MaZbpU26sZoFHYy6NBIfwcnHWRg8L9AJ/yIFEue8R0Va2ockIxkueWHQ2C
	8Tgv24GA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTI-0003gl-1n;
	Tue, 15 Sep 2026 15:45:16 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTH-000FKf-2h;
	Tue, 15 Sep 2026 15:45:16 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/8] dt-bindings: leds: pca995x: Describe nxp,output-gain property
Date: Tue, 15 Sep 2026 15:43:50 +0200
Message-ID: <0eb2e22d54062bf4d6e50e18a27063529510b9ce.1789477502.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28124/Tue Sep 15 08:27:28 2026)

Allow configuring the output current to adjust for different hardware
designs.

The output gain relates the output current with an external resistor
connected to the LED driver. It does not directly correspond to a
meaningful physical unit of measurement, so we refer to the datasheet
for information on its calculation.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2:
- Add nxp, vendor prefix
- Fix default value to match existing driver code
- Describe retionale for using register value directly in commit message

 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
index 201f32f1b8139..372ecd18043e0 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -39,6 +39,14 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  nxp,output-gain:
+    description:
+      Set the output gain controlling the LED current as described in the
+      PCA995x datasheets.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 127
+    maximum: 255
+
 patternProperties:
   "^led@[0-9a-f]+$":
     type: object
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/
