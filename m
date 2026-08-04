Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262CA3A7582;
	Tue,  4 Aug 2026 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876667; cv=none; b=MKQDI/7s7onWhRyO4o6kq+uZZzW7ouZx4r6cxuX7TJWsbQW+UdBxup5wyMKv1Dqbhzc+0zS3W2+Y9huRqKAfcpN7C+8H2LOVkBiqCpWfjXDxUt2KlW8I6PBr0GyelYlWtN5NGnHRBny//VdACOtiKLlwDQf47aFTWCD13mgdJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876667; c=relaxed/simple;
	bh=ik8wAsUZs+G82TmKCJ4S64ggHyv+Ke8Nuwr/z5zNwKQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jj3XXBF54IRi45A0Es/OkqXkkSuMhmjGeXl8GMwQVNpNVxwu5kPhaJOT+XlPkfwNGHItYdX/R8OynEc7WXoTcxq9bfY+Hm3WxvuEMbo2jWpc8GFfMuMyfhe6FtY/JqGxcSE9QknkGKPpfzphq+PlGp2rC+90VsaREH5ZNJpciYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNwVfxpv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNwVfxpv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3B91F00A3A;
	Tue,  4 Aug 2026 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876662;
	bh=ik8wAsUZs+G82TmKCJ4S64ggHyv+Ke8Nuwr/z5zNwKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eNwVfxpv59VymYZhW0O0KQ3dyrgqgjAE5tekgGPPlZkhowVwGB3otPVK7XAtKYIhd
	 nIfQGlZKEVYnh41qv48HB6mqJnqYD3rhnHU4+DSwsK3/ly4sLLDxs4KGiGzWVN1/cO
	 EpNcAitiSXuVkVAfr3PWnD6mmu3in53V95UPwYPD6TCtQvlt8xJX9N6lihpN5ilRyS
	 tRDui+QzuwVDpU48ipQap9iLjq+o46vNzSe8EZP47qjUnGiQ35RMwQFU1Cq4eCrWVp
	 rfu00IDvUZjdwNPluyIY5i+yvRvm/l19o4SFYOjFMaYKunC1eFNu2Te/FAVWYEXabE
	 LsDONU0NvIMEQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next v2 6/6] ptp: ocp: Add Time Card V9 I2C peripheral
 topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260803205011.1249-7-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
 <20260803205011.1249-7-ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:51:01 +0000
Message-Id: <20260804205102.3A3B91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Time Card V9 places a BME280 at 0x76, a BNO055 at 0x29, and an
> IS32FL3207 at 0x37 on PCA9546 channel 1.
>=20
> Describe GNSS1 and GNSS2 as RGB LEDs on outputs 0 through 5 and SMA1
> through SMA4 on outputs 6 through 17. Select this profile only for the
> exact EEPROM ID "TIMECARD-V9".
>=20
> Earlier Time Card revisions expose the same I2C device population with
> different LED routing, so probing cannot distinguish them safely. Leave
> erased, malformed, and unknown board IDs unconfigured.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803205011.1249=
-1-ahmadexp@gmail.com?part=3D6

