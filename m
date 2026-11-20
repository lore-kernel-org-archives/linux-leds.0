Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210639;
	b=qC3L6IcWr5JmjY3xOyrwH/B9bdttInrZ2+kD5WxdMGCxpBzFnJyyR5ejUVbfXk/pbSTG
	 MjuFVsibx4wQDQu/N+DEubZq2V8brdulQslALTF9frXRBa2DBvv8+meZZritWXpl/4j7u
	 PIrbu63wvpNn11PG2vVwPpwjtIujFXxQqys+zgN5FTI2+Z5MLk6uE8gyRYwmzWhycjP+z
	 UgAlFGOyb0nQKhLyu+I/h5mofwXx5Km2YBhwOtFmufNVHqFKiYV+7ufCmdioQe9W7Sf3a
	 f/deZKd+862AnnULqGyBU8rhpX56QXKqZtCJ7DDbuwhf0zYZdzJ84iAzy4+mSzk9Qhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5bXVEhQHcSz5UE1oP5PM79CXexc4JZLDl8FrOUpl5o4=;
	b=of3LS9vv2OdZNM8ZVyjGQmdmlUbxne+0cVPJ3SQ9ZWarP3oo9uVk0GWGSfcc+8ULdY+6
	 rhlkDHInd8GcZn2VxbBm7MSPvILprRDiwhtjy0utItociKIZm/pIuhIIZ1U/ZLIUEJqb4
	 GPzoos1VXp+2Zq/EBfMxRBfSgG4Ig2eBmqchzE5w2M9u/K79XMGHjA7uQa4LevP16xjvi
	 LQeA6+VcQP0lg2Dr7Poh1fA7rzTPdAaWWgemO4w9BUt1VZocvX75/+s0g4u706oS06opR
	 PCFtk+7UdzQf9EjhGnMD1dT+BnPjC172DkFVjruc+KDwvMOlSsQI9nm6XYt9giv9ULw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RljceKPk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25A606A333
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RljceKPk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F3B1F000CA;
	Fri, 20 Nov 2026 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795210639;
	bh=5bXVEhQHcSz5UE1oP5PM79CXexc4JZLDl8FrOUpl5o4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RljceKPkO8R+/3FiTevb5a5W7iPjSvBl8PD1L/G0eSdMhb512AUzeGZ7Vkmo64rGJ
	 w3/0A3E8r2KFXtaHbFcPHqpnH7s5DMuMp9Ru5zYzIsjzM6iQ9NBP+mQ+rm0gK9BOG/
	 M0bx5hq7nU5IdgunTIDyNWgGy7elY6hdVYdrV7Dl96f6+GvMNsIZqx1+JQK8Sxrjdo
	 jA982wsh3y44vV36KI4kOdI8q9AjdDPhBHBbEcnYju8xSuXyfGORUOh4ELkz1jHpmR
	 X7/TqiDOUJ09dYQA7fYIZ1KvJw66KdiF6lzJs6dc6vHcc6ObbShWmFqL3kcBB2PXIa
	 bFA61PhFJ+wEA==
Message-ID: <sashiko-outbox-226201@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 00/11] leds: class: Support custom sysfs groups on
 multicolor and flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120212431.152081-1-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:37:18 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 11-patch series:

- Patches 1-3, 5-9, and 11: no issues found.
- Patch 4 ("leds: class: Create "brightness_hw_changed" attribut..."): 1
  potential issue (1 Low)
- Patch 10 ("leds: rgb: ktd202x: Initialize max_brightness before..."):
  1 potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 4 and 10.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120212431.1520=
81-1-W_Armin@gmx.de
