Received: from out-93wp-a12.jellyfish.systems (out-93wp-a12.jellyfish.systems [104.207.68.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9029427FBF
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355377; cv=none; b=mPYu7czbTn5U0DsG2E3yCzdmlaqJr6FNJxX+pquG5L8shA8IpnvdyyjSKs6WOxJWK7SN9vSWiPVlBXgXdmmIA6t/osOi4FGnFdDFhyIRl91CRkR766+SzT1RUgBbodzWV65b202lYFX6H2pI6rCrzp8qPJxQlRnEIjMN4HB3ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355377; c=relaxed/simple;
	bh=2PGAzzRlSdrIQUC+PQFeAibSGLtSOBZUnNfKQJY+qTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lMcj1mCGrwNBVIWolgsYZo+S1ulOM2qgZ65y+PO7k13A/BuOkbTP+dYUye208PR0ef3ap8UoyQcoqR/7p5+BvAjIBIjWIWjpRCQTdqQ+YFleZn7G9AbyVF06EPjsC2G99mHp/6o3IYhQFoUITuT7MdfWStKCHYzB8eN2hzKtzpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=nk5rnZQs; arc=none smtp.client-ip=104.207.68.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="nk5rnZQs"
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j78Hk5Hsbz8sWP;
	Sun, 18 Oct 2026 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792352627;
	bh=dlM6jqufpKiSv8mOhbn+KjX0+8BaJbqWVeEnLDQePCM=;
	h=From:To:Cc:Subject:Date:From;
	b=nk5rnZQs3mBOMaxEhjyLZ1OLkyoD28nAqGDQlg674ZEXLclVqwtqYjoYaAE/ZdHLw
	 kA4EmrXzczeMHEjztdJ8AEgldbCr143A/q6FvUCNrfISJX5+aY0a+w/YiDB148IcEY
	 yUNGeaMoJboiDLOA83jNhmEi+/mjsJmKQyzIkwh0xq5UeH2WX0w8wnfUoCiD+fCmrg
	 H87zacnx9niX5Lq6Ccq0EXhMalmc9rychuqiHZHANmCbb2l2Y+8zF4sJAOtKDhgf3e
	 4/xLmCvjxWWFdgagdftmUHOP6cxfte4SzMoxoiwIKlo/hiyYSzz8c/ULG+9NrDy7m3
	 NIRJHTYlfLPyg==
From: Ross Cawston <ross@r-sc.ca>
To: lee@kernel.org,
	pavel@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software control
Date: Sun, 18 Oct 2026 12:43:35 -0700
Message-ID: <20261018194339.132-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

The RTL9300 switch drives up to four LEDs per port over its LED
interface, serial or scanned, each normally showing a hardware function
chosen by the LED set of the port. Some boards wire LEDs to it that have
no hardware function and that the vendor firmware switches in software,
such as the PoE status LEDs of the MokerLink POE-10G07110GSM.

This series adds a binding for such LEDs as a child of the switch, like
its I2C and MDIO controllers, and a driver that takes them under
software control and exposes them as LED class devices. With the PSE
core's LED triggers, the PoE LEDs then follow the power delivery of
their ports. The registers come from the vendor SDK's register table.
Tested on the MokerLink POE-10G07110GSM.

Ross Cawston (3):
  dt-bindings: leds: add Realtek RTL9301 port LEDs
  dt-bindings: net: realtek,rtl9301-switch: add port LED controller
  leds: add Realtek RTL9300 port LED driver

 .../leds/realtek,rtl9301-port-leds.yaml       |  84 ++++++++
 .../bindings/net/realtek,rtl9301-switch.yaml  |   3 +
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  13 ++
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl9300-port.c              | 201 ++++++++++++++++++
 6 files changed, 309 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.yaml
 create mode 100644 drivers/leds/leds-rtl9300-port.c

-- 
2.55.0.windows.5

