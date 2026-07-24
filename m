Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3137B344DB9;
	Fri, 24 Jul 2026 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905444; cv=none; b=EKOc4yteMD+Apz3o128BlJ7Ia68ihKHQuOe73NphQchUGbGXfowDCTdMgAV3zUFEWIGrbyaCAiGICp4sxim5nsOOD9zlbUdH66n3vnNep11W4zHhYj3gBJ9iintr3yf0ZvjiM6wHpSnY5fwoklR2j1IbB4F3yVtxkPZE+WIV0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905444; c=relaxed/simple;
	bh=7L9Y5OEKs8rIutOifX9tSlz5xP6m3LxsI6O9IkiTZE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D/c/qppPnHW/gLoxc+kxhRAvbS+hztghjeZ7YaYs7vbOoLuF+psfmEy7iHRRuMR37sFAVQoLCzKNWM3pWQgPWPZqkd59pbSk84WaJHdVbkLwPEd1rXWtuJq+AuEYUdZXhF+JZ71cKkbiLwaxISsZ3DV0gU34IZnfnMDHUk7G29A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euxm07zc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euxm07zc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021C81F000E9;
	Fri, 24 Jul 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784905442;
	bh=7L9Y5OEKs8rIutOifX9tSlz5xP6m3LxsI6O9IkiTZE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=euxm07zcnu4CKaCXqW8FXxpMVD0vRTRc7tk+60ptkH4OHkVJ55NocuhObONvV6GIZ
	 cu+iXA0pSg3HYuORF8kjZa7oZrhhl0bVds53SEKyw+BMp5Q3ao8ilDx0qZqWXeySDK
	 4/WXf/oUo/6i6S8FUwHN7q4LOh+IJVSq2oplYRV8IosuQWGRqqAFV6Al600xn0DztM
	 0CeDnlJVEKc1oO19LHNbgCf9Z74+RpSxVmka/5LMnzgXAudq7H5FFO6UrUhHzVwgUs
	 Wgn0oAzzz5aaguX5FKI6Hg7OjYaYekH99taNgqTGQFK8qspa0o3YrXSNRPl4LHFYT4
	 f8UuRkQd5fxgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260724-synology_microp_initial-v17-1-e2f70b4dc691@posteo.de>
References: <20260724-synology_microp_initial-v17-0-e2f70b4dc691@posteo.de>
 <20260724-synology_microp_initial-v17-1-e2f70b4dc691@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 15:04:01 +0000
Message-Id: <20260724150402.021C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add the Synology Microp devicetree bindings. Those devices are
> microcontrollers found on Synology NAS devices. They are connected to a
> serial port on the host device.
>=20
> Those devices are used to control certain LEDs, fan speeds, a beeper, to
> handle buttons, fan failures and to properly shutdown and reboot the
> device.
>=20
> The device has a different feature set depending on the Synology NAS
> model, like having different number of fans, buttons and leds. Depending
> on the architecture of the model, they also need a different system
> shutdown behaviour.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synology_m=
icrop_initial-v17-0-e2f70b4dc691@posteo.de?part=3D1

