Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC33DA7CA;
	Tue,  4 Aug 2026 20:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876660; cv=none; b=axInWJudVSyjQ8W4uS7l8BneBNg4vOANT3XtNiw/RO9km7DxSw9wTmNPpHCmTx9x/AxHdxYR6GFkTvcddTt7kWUwhU7xpPVzyos/skM5FRaNW+pEKr36XQN+oefT76LayPkfJQExsOcMlRHWp9sNy0PwrqTUvDtg4P4t2xDL/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876660; c=relaxed/simple;
	bh=I2Z3yjWFf6DKUPbxBf3GwB9GlPLw4F8qWF3DrRGt/cA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FR7r0g5DbDZW8UeXWN+E+hfCwW9LfB5Dptvg3W/66s8YID0zFAUM5OTaEPp/F0QcV9MnIRtRAk/pXREQTvgP1K8jlHCIF1Lx7Za9e5M4mugRjQZe1oMl1VgR9PTpqrK5tSelT4rCrmN+ALuWRkyV55ZyduW+q6dsxd9Mi39gy5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4OgqVhy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4OgqVhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FC01F00A3A;
	Tue,  4 Aug 2026 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876655;
	bh=I2Z3yjWFf6DKUPbxBf3GwB9GlPLw4F8qWF3DrRGt/cA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E4OgqVhyQf+gM9mlGx8NOTocUkqnTYBNg+kFhYBQTdIkIdelQ/6pHqKq0YxKwFSaM
	 m6eW5VgF1RtEyxg+b2uC77Y70RTcd9ymvcvc2SheVMkdJndA2p9BFvD/KmkCKquXTA
	 +PSMiv1+gSO30/U4xK7jjvyY8XQU3WsFjolT7qBrWL/aCDovmXXinCnQFEWokpyKx2
	 ZQEU1rxmL4WNDMpEjob4G34uBD1ZVBnRJt6v4viAWPDCamiRBN0fDjj1pDwdnCdBQ2
	 k+M5l41WBK0r8pf+Yt7hf3K5FDhqyfomvl12h/VwesDy4gj42jrV0i+t49+eZNufwE
	 Kc8Re76a0sF1w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next v2 5/6] ptp: ocp: Add R4006 I2C peripheral
 topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803205011.1249-6-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
 <20260803205011.1249-6-ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:50:54 +0000
Message-Id: <20260804205055.67FC01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> R4006 cards place a PCA9546 mux behind the FPGA I2C controller. The mux
> exposes three LM75B temperature sensors, an SHT3x humidity sensor, an
> ICP10100 pressure sensor, and an IS32FL3207 controller for the GNSS and
> SMA LEDs.
>=20
> Describe the per-card topology with software nodes and instantiate
> standard I2C clients after their adapters appear. Use a reusable board
> profile selected only when the validated EEPROM ID begins with "R4006".
> PCI IDs are shared by multiple PCB revisions and cannot safely select
> LED wiring.
>=20
> Leave the channel containing the BNO08x empty because no upstream driver
> exists. Retry asynchronous population with a bounded budget. Serialize
> population against controller and mux driver bind/unbind, remove the mux
> when the root adapter disappears, and support adapter reappearance. Limit
> the existing i2c sysfs link to the root adapter.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803205011.1249=
-1-ahmadexp@gmail.com?part=3D5

