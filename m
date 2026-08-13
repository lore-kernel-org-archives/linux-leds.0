Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502B5481FD6;
	Thu, 13 Aug 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630663; cv=none; b=pO0Y9EXpUsirifWVMRQqwvM9HQqmqcOIksas4v/ssc8vNd8gFKveOpavvF2isRmKwsVR5IvnPYHqCF2m3GqRcbmJDVEC8FmiOa6pbf9Ba+A6IypU63AsCJFX9JA/RVK7N7YGtazAmLGgc7xYD56VOruG3wuR1KJjy6idzsCcmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630663; c=relaxed/simple;
	bh=jCfgDfaW9bLnG0UYZxkIcW7fG0bjW177etlrrfHsurI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wx2GonmYIIG7E45vh1ZYnzOiJrxxBgovGtqeEy14d4n+FG2mZfmkn6zfJodgERN+5Gw/ju5Z2AcbqWDQyPeRMfI/PWLs+yF5jznFTcO9HPHFfVPTDnvoh8aGtjPOBeZI5O9IN/YTVQ7LHm+btv1bwnQaCyKvVGfPypZOaHlJQKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDgmzOwf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDgmzOwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5F91F000E9;
	Thu, 13 Aug 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630662;
	bh=jCfgDfaW9bLnG0UYZxkIcW7fG0bjW177etlrrfHsurI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eDgmzOwf5/iso35m+Y2Fk2J4DjLIBTseaHusPgegTj4Ir/rrC7PbII/by/SQ3GJxE
	 j/wXxxJf1K2nT3+aVyePqkn3qmhxfFr7MOTA8gcvJjaGvKD2W12NRWLvfdtsqCMtHG
	 IqWClXXGo40m3QGxo3d3xpVMhaTe1l9FHk7MWCGC8FnUOebWGyAQoEnK2Xj0yr21Yj
	 uuctm09XJF9Y2kuNqqq8bjXv+MwDHOrQBcoTGDRDAkItdWIyXbsFLCYCyUpknAojij
	 lom8JiyPBUYSbBdlJ4ubdeuOARpFupLY3bNQfuCaf3VEeSPxHn3+uNKtrVOUGurtiE
	 h5ckQJjMrNXJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 4/5] ptp: ocp: Add R4006 I2C peripheral
 topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <9b73c41a9f94482227af5879b11747668fe9af51.1786543681.git.ahmadexp@gmail.com>
References: <cover.1786543681.git.ahmadexp@gmail.com>
 <9b73c41a9f94482227af5879b11747668fe9af51.1786543681.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:17:41 +0000
Message-Id: <20260813141741.BE5F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> R4006 cards place a PCA9546 mux behind the FPGA I2C controller.
> The mux exposes three LM75B temperature sensors, an SHT3x humidity
> sensor, an ICP10100 pressure sensor, and an IS32FL3207 controller for
> the GNSS and SMA LEDs.
>=20
> Describe the per-card topology with software nodes and instantiate
> standard I2C clients after their adapters appear. Keep the mux channel,
> RISET value, and per-output current limit in the board profile, and
> validate every profile index before constructing nodes.
>=20
> Select the profile only on supported Time Card PCI devices whose
> fixed-width EEPROM ID contains printable text, valid zero or 0xff
> padding, and an R4006 prefix. Leave erased, malformed, and unknown IDs
> unconfigured without changing the EEPROM data.
>=20
> Leave the channel containing the BNO08x empty because no upstream
> driver exists. Serialize topology changes with a private mutex and
> stable device references. Retry transient setup failures, report
> exhaustion once, and continue low-rate recovery so late adapter or
> client availability can still complete setup.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786543681.gi=
t.ahmadexp@gmail.com?part=3D4

