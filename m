Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F123ABBE
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934257; cv=none; b=En8bOJr1C7IJdML7t2+w+HiBnKsjKBh0GNVW+7UtMjjgf9WJhLDQtKZ6T/XD+cl7J9MZSBgAZ+TqRBCUeHVQikOqRssVNUAbR+HQUZf2Ayod/+hvA//bYfPUFxp/bMkFPPsxFU+WwlnLDO9EseGGUaUXbdeFH5NQv92bud+QjRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934257; c=relaxed/simple;
	bh=dCbxEHEtuRekDpqhYOITo4tX7+/rDasxSclMXCtk0D0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jBR6bZMW5+R2uDuMdWlLl9MM28899RyUbQkTrRtwY3gNck095Ga5Ni03n2MCApRzdSIqkhM/RODlPfUww2ZmmwEUqDnTs6nznSn7N3eyM9QfDKfZfZ9D5ob6lRf0r2lBGS3CWjDCR2qjfs7s8F5MgjTyH1ELXZpujFfsfdY46yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aImkRsKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aImkRsKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB9B1F00893;
	Sun, 20 Sep 2026 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934256;
	bh=dCbxEHEtuRekDpqhYOITo4tX7+/rDasxSclMXCtk0D0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aImkRsKYdIJQZ8BuIUJ2jA910wE1YipHCyDBNc7WvYlNDLRvSMJYRmwfs0qWxDrjw
	 aDnW1/dpX9BB9eJGlBQKZn9MT9iQg8bsHZUUOVlVAGC5L8sjsdVtlHMnzyjAXcs9O9
	 hUKQ5ZRpRXwVcpnk12VsXlj/4zxl4dUJYZMsEbsuetledQTAw8bJJInF9HVjXLhAJg
	 tQYq0xiuCHSEuKVHkHDPLiaQIIm+X74gP8E5qZJ0Znq7YyAZdwI2lbN7yqz/+WJXpJ
	 EITcdn16UJtf0hVMVVIQLZbYbGMSyLyYMLgzrlXHHpABliCYHVVXSTqverhg4OQ+Jb
	 qbms4cbklVqsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/13] leds: trigger: Move led_trigger_group to the
 right place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-4-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-4-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:35 +0000
Message-Id: <20260920195736.2EB9B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently led_trigger_group and its members are placed at led-class.c,
> but they falls into the triggers namespace and does triggers stuff.
> Placing them at led-class.c also requires the read and write callback to
> be exported and results in an extra #ifdef block.
>=20
> Move it into led-triggers.c, so that it becomes the only symbol to be
> exported for sysfs attributes.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D4

