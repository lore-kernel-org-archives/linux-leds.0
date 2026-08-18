Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88C480DD8;
	Tue, 18 Aug 2026 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072248; cv=none; b=d9VKegc47KC+Lz2KHi0PieC6Y5rOW5k9T5WzK4tn23G1Fu2P0QT01jovuugCeyoLeBua1PO8V6H2AhKo2B/JUxZ1qHq68653jN4oase5sQqv/3d36Fu1/JT39HpZfeVwyI7zStO5mMBymkKBiwvRpsqIlBd6RC+j3cI7XjF5KnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072248; c=relaxed/simple;
	bh=Njtfo7cG2DJUooPff/hlSLkJ+elpXxmyFux2khcQtAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rl2wYMqCeKT3x4VJ4f0mk0UCZiyGzbB3kGV2CV+ruW/Y81YxWlf9fTsMndUAa+7uz+ErylMjhh2R8CXLP8P9gbaxuAfJFe4K3GVG3gca62uhz6ViaYjB/My6K35xC1iZQBrs0db4+p1kru8rp2grtI5QXdnVKCD4TBNla6NzbxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QsTZQ8/K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsTZQ8/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5E41F00A3D;
	Tue, 18 Aug 2026 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072246;
	bh=abgRy65YGwEXbFDxHjZUTGfQhk+S+q67bjg6m2HmLKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QsTZQ8/Kq9tI5/uT6cR+WqN38Y+iGfdorPg3A+KBfs5KqOnM6bdsHrG6xc4U1aafU
	 oc72QhDlI4mci0i9j/jbL8C7O/QDrR4XcD5SDtvLS3tohtpF88ocjKD2u0ndm0RUe1
	 I9egtGhpJHY/7RhPFhRc5akvgkVELqMNt+X0WKbKHrLEy3bKOTnKOORU1ZrGAL0/3m
	 xYo4x1HL1aFGBUkIY301YsIpzcFdghudY5MEdVgLWp8kGXXaEkxjgn/LXViAc3pLOD
	 IbeK1P/iSciCbSMvkzIJqE8kxdpCo0JaKOITFETDaXSmK4emV/uKhvQSrnzEHrLvGK
	 pNfJ1c4eM0ZRA==
From: Jakub Kicinski <kuba@kernel.org>
To: ahmadexp@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	peda@lysator.liu.se,
	trannamatk@gmail.com,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 7/7] ptp: ocp: Add Time Card V9 I2C peripheral topology
Date: Tue, 18 Aug 2026 09:57:24 -0700
Message-ID: <20260818165724.4008556-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1b0ad989c6290a400bd642f9fb2d26d965bc02c8.1786747084.git.ahmadexp@gmail.com>
References: <1b0ad989c6290a400bd642f9fb2d26d965bc02c8.1786747084.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
ptp: ocp: Add Time Card V9 I2C peripheral topology

This adds a new I2C profile describing the Time Card V9 board: a BME280
pressure sensor, a BNO055 IMU, and an IS32FL3207 LED controller at 0x37
with six RGB groups. A new helper, ptp_ocp_board_id_matches(), selects
the profile when the fixed-width board ID equals TIMECARD-V9 with 0x00 or
0xff padding.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 5ae50ad83bdac..5100278f164d3 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -643,6 +643,73 @@ static const struct ptp_ocp_i2c_profile ptp_ocp_r4006_profile = {
>  	.led_max_microamp = 8150,
>  };
>  
> +static const struct ptp_ocp_i2c_device ptp_ocp_v9_sensors[] = {
> +	{ "pressure@76", "bosch,bme280", "bme280", 1, 0x76 },
> +	{ "imu@29", "bosch,bno055", "bno055", 1, 0x29 },
> +};

[Severity: Low]
This isn't a bug, but the generated software node for pressure@76 does not
describe the supplies that the BME280 binding marks as required.

ptp_ocp_i2c_init_nodes() emits only two properties per sensor:

	if (sensor->compatible)
		topology->sensor_props[i][prop++] =
			PROPERTY_ENTRY_STRING("compatible",
					      sensor->compatible);
	topology->sensor_props[i][prop] =
		PROPERTY_ENTRY_U32("reg", sensor->address);

Documentation/devicetree/bindings/iio/pressure/bmp085.yaml lists
vddd-supply and vdda-supply in its required list, and bmp280_common_probe()
calls devm_regulator_bulk_get() for both.

To be clear, this does not break probing on the hosts this card plugs into:
devm_regulator_bulk_get() uses NORMAL_GET, and _regulator_get() substitutes
dummy_regulator_rdev whenever have_full_constraints() is true, which is the
case on ACPI systems because acpi_early_init() calls
regulator_has_full_constraints(). The visible effect is two dev_warn()
lines of the form "supply vddd not found, using dummy regulator", plus the
description mismatch against the binding. The preceding patch in this
series relies on the same behaviour for the R4006 invensense,icp10100 node.

Is relying on the dummy regulator here intentional, and would it be worth
saying so in the commit message?

[ ... ]

> @@ -2243,6 +2310,22 @@ ptp_ocp_i2c_supported(struct ptp_ocp *bp)
>  		bp->pdev->device == PCI_DEVICE_ID_CELESTICA_TIMECARD);
>  }
>  
> +static bool
> +ptp_ocp_board_id_matches(const u8 *board_id, const char *id)
> +{
> +	size_t len = strlen(id);
> +	unsigned int i;
> +
> +	if (len > OCP_BOARD_ID_LEN || memcmp(board_id, id, len))
> +		return false;
> +
> +	for (i = len; i < OCP_BOARD_ID_LEN; i++)
> +		if (board_id[i] != 0 && board_id[i] != 0xff)
> +			return false;
> +
> +	return true;
> +}

[Severity: Low]
This isn't a bug introduced by this patch, but the new helper documents
that 0xff padding really does appear in bp->board_id, which makes an
existing formatting inconsistency reachable.

ptp_ocp_devlink_info_get() formats the same field for userspace:

	snprintf(buf, sizeof(buf), "%.*s", OCP_BOARD_ID_LEN,
		 (const char *)bp->board_id);
	err = devlink_info_version_fixed_put(req, board_id_key, buf);

The "%.*s" conversion stops early only on a NUL byte, so for exactly the
boards targeted here, "TIMECARD-V9" followed by erased-flash 0xff bytes,
devlink publishes a DEVLINK_INFO_VERSION_GENERIC_BOARD_ID string with raw
0xff bytes appended. The write is bounded by OCP_BOARD_ID_LEN over a
u8[13] array, so this is presentational only, but the two consumers of the
field now disagree: one trims 0x00 and 0xff padding, the other forwards it
verbatim.

Would it make sense to trim the padding in a shared helper, or in the
devlink path, so both call sites agree on the encoding of board_id?
