Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580898;
	b=DzTRZoSxv17nRyXbdLDN0RQcm+B/l4Xrx85vyKd571y65icGeyk/fr70wljSEc46tdN4
	 hyVTsfyud4iQ1S9lxma58eXq0o3Rdt3FIt9QLeVdARpHFVxG+PpKyrjRkIF5WL4wB/HIh
	 hcYfyu4plVk4AgrjESAfU1ft5+LbCeNqY1GDLfr/0BsFDJq8YpKzazd+LltKqNc7EPgD2
	 fWnBWWe6pQMIfn6UdswLIfxg6capRLgyKjZ4M4oLNs3c0XtMKBgAJazX1o3qosSq2NVvj
	 drvkBqq9eUAPTK66cz1G4dI4WtD/JpFiD8/NZr6f7Uejgjc/OfZeHZ1yqoWyIdnEk0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580898;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=uYq1sVzo2nBskuEZSx11uphu7KgNRbPt/am6GuCuVGo=;
	b=sFpql3+wo42F0Ni/5+VaYGDJtrRVsSUpH1XmHA489yNw+yqsllhIoqxq50XtZDqcq7s9
	 SmuYyeX7pFGqkxoGBROjtVvqBfn1aK8RAwDmrS68HHoi33XbSC74MoWj60o+7c+AktUNi
	 QXkeoN7fG4MsfvgrjHIeXieHQWJoUlme/ZQVHNlbTO4rr+Si2bHBJn8N19t8uey3rwFbs
	 J1ByNowLzluuCZCoQJroF0P9T/7dTX4Fjz4xV6YCGoeMW3zlJmV16K4v5+Mg+ajXR0jgr
	 hAN4CWEq+qLR+/G02E/ZIoV5uWSLGFaZNTXHeNm8tz07DhgGVByDjcAqZxENN/KQcqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MihQIqsw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9157606A323;
	Fri, 13 Nov 2026 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MihQIqsw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AE91F000C4;
	Fri, 13 Nov 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580898;
	bh=uYq1sVzo2nBskuEZSx11uphu7KgNRbPt/am6GuCuVGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MihQIqswDmfS1f7FZ6MvZnWuXUuGnicLIUqCaPrx/C8uzhNrptdEA4IgmhH5rZ6H0
	 alnyPDS5oILvdzKKDzj77lTgk8Vemjso4sbe+NCB7VWULy+7yMBXMEMPrjbm9VHzVj
	 G0ZKnZgAk1IBhe+4KC7scDXY63xTQFkE2ryCrZgniShjzyz74PrM553Pgp9UjobR1T
	 3O3DFxM+rb/VnWC2E7EgXhGQPSMcnSF1Vk+drIWV77k5O25SW7Fkgm4Iv5ShkpnDNw
	 utf3tXtSKc+tEnWXAPskWYxgCHnYkDc3Oq2E0TYXikPzMyTgdB6NIRzLD52bOb1WZO
	 TU4szCJ/V4KwA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Akshat Rawat <akshatrawat095@gmail.com>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261101033427.442-1-akshatrawat095@gmail.com>
References: <20261101033427.442-1-akshatrawat095@gmail.com>
Subject: Re: (subset) [PATCH] leds: class-flash: use sysfs_emit() instead
 of sprintf()
Message-Id: <179458089729.68557.1662330631376220276.b4-ty@b4>
Date: Fri, 13 Nov 2026 14:41:37 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 01 Nov 2026 03:34:27 +0000, Akshat Rawat wrote:
> Use sysfs_emit() instead of sprintf() in sysfs show callbacks
> (flash_brightness_show, max_flash_brightness_show, flash_strobe_show,
> flash_timeout_show, and max_flash_timeout_show) to conform to the
> recommended sysfs attribute formatting guidelines in
> Documentation/filesystems/sysfs.rst.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: class-flash: use sysfs_emit() instead of sprintf()
      commit: 5290f1b863aff2659f53f0e81712c9bde70dbf9c

--
Lee Jones [李琼斯]

