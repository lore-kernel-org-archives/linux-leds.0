Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F8B286D7D;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465258; cv=none; b=uViW3HLK2z9v563/Pcoy1pnd9ei8yvVGEja3Pw+I+uS0MB3/3ZWBaiXOuddYQLNt6oCBN8CkwUdCMAC0GrpBQTdliZGWlCISUkhLHFlEJUNvO1aQuHCkcb/PJaNreV5xkroDzDV8/oaYrb7Fx6sUpQqmd88eSzRj3NQ61Cswcv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465258; c=relaxed/simple;
	bh=U1LVZKiOs+6bdtnsgEbKMpwzp18gX4CvEKWahajFxIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPJB1gK5A+dhS01uYaFfMOsbBegQArFU4elIvsQL16ibH32cP28F++LsdfATSvlBWWp+PAhL0PlIGtzLpT+xI7pSuJSJrBUHaSEWa6cIoP7GeQwD+sQu7XGZpvK+240z7Si16OKHh0kZYBfLJC2MP+PcSygviikTdy3W67HfkiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OthBj7Jy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OthBj7Jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6BDC19423;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465257;
	bh=U1LVZKiOs+6bdtnsgEbKMpwzp18gX4CvEKWahajFxIs=;
	h=From:To:Cc:Subject:Date:From;
	b=OthBj7JyQNqVdWBa+tKkfsYwNOE/jnS2htS8O+CFjl6ketwgSJoNjVhwLQTZL6V0G
	 CjuUrsCOhwpRItGRBVRaal/b7rZ6XONV0bGXnv9P0BToxAGW+PPTCCZ5DHMUzBz8E2
	 5pLo17vIyLBMJxvkuqR/HjAGvq8/ymI0fKGro0jcs0fXLWPhLhdDI6R0/g7+IhvItV
	 jfRaBHEidcdTb6L7Vsoz0kJAEJBA2xEBKvU3ILPk0I3xnvZGe9nz8cvnz7/xBEbwmO
	 IDOKTpqX9MpDWbz1IU6NBHsr2BahWRhGxMUyU+IgGAjhtytAn3o7kCYU5JjN2bfd6W
	 Pi0jz+yf2l4ew==
Received: by wens.tw (Postfix, from userid 1000)
	id 0B27D5FCAC; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Mon,  2 Mar 2026 23:27:19 +0800
Message-ID: <20260302152724.3197587-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This is v2 of my A523 LED controller enablement series.

Changes since v1:
- Rebased onto next-20260226 to get rid of unmerged context
- Collected tags
- Link to v1:
  https://lore.kernel.org/linux-sunxi/20260225160828.1687643-1-wens@kernel.org/

This series enables the RGB LEDs found on the Avaota A1 board. The LEDs
are connected in series to the SoC's LED controller.

Patch 1 adds a new compatible string for the LED controller found in the
Allwinner A523 SoC family.

Patch 2 adds a device node for the LED controller to the dtsi file.

Patch 3 enables the LEDs found on the Avaota A1 board.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
  arm64: dts: allwinner: sun55i-a523: Add LED controller
  arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs

 .../leds/allwinner,sun50i-a100-ledc.yaml      |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 ++++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 3 files changed, 64 insertions(+)

-- 
2.47.3

