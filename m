Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA02F36C5BF;
	Sun, 11 Oct 2026 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746094; cv=none; b=tnyaoiRH642qGzyhn9ijImw7ARssshVcdMDHeaF2cBA3uwJLStJgrxAvZU1CdPfsQ4wfBwIQQewRHA6h8pdlMLxCr0e98BbYIShvclSOsOtseuH6UTEJa1DhwNj/hXQkqfyjYjiZMJZotvXre5AbuQbjqC6XKobJYRkF7LCbDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746094; c=relaxed/simple;
	bh=2ZZJir/NUJbdWc0PtKFpYxRK9UeoQLdYcSg1VQyLY5E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bhqlfqehQZg91H8uBs55cOiCdrZtVxP1iXUatnyyDil8mHJyLX2zWl74QMZk4v9DtFxVZLDDzlGEEXhZnNuaJpMMROMFkVjyMN2999pkRJj6VVbH1KCxxKMa2DTnm3eFJzO6yVY+GtlIE1tNPZaJQyfAp1TMBpaWl3tcjGWGQzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEZXhSDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEZXhSDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B2B1F0089C;
	Sun, 11 Oct 2026 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791746091;
	bh=2ZZJir/NUJbdWc0PtKFpYxRK9UeoQLdYcSg1VQyLY5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lEZXhSDSMuvfz194STsAp9lK6erqyD/J8png/vffOc9D1hmr7eIxTTbs7BkmnhQVL
	 g5TVdDMEwIKbAGgCLriSrC+WS1m2wZw32JH1xgRROZE6IAPPOVJlMYIRv/0XkpZtzt
	 wbLVIrZAgfuIKi0cMMoy4M2PDeTkTQtDDqSbAM4hBur0nIh0DO9IIJ4v+eok2abXNN
	 oXoxM82eJtKXnW79KJ7vQBHnar1Ri/lQtV2d5ueZA7zBN1+iEVGZANiLdBLQChf+S4
	 RlJ/+2OsQpsj/CzPfOffHhUeUFNr5gx0w6J3CHiQwi2A2rbRhbgbbA/p1R0qutRshX
	 vfRXjun8H4meg==
Message-ID: <sashiko-outbox-167397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: Document TI LM3643 dual LED
 flash driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261011191026.149338-2-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-2-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 19:14:50 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: missing driver name in commit message prefix
--

commit 3be78a7ca4f65d71d150658aa87edd42d6d057a1
Author: Rillian Grant <rillian.grant@gmail.com>

dt-bindings: leds: Document TI LM3643 dual LED flash driver

This commit documents the devicetree bindings for the Texas Instruments
LM3643 dual LED flash driver.

> dt-bindings: leds: Document TI LM3643 dual LED flash driver

[Severity: Low]
This isn't a bug, but does the commit message subject omit the driver name
in the prefix? According to the LED subsystem rules, commit messages should
include the appropriate driver prefix followed by a capitalized description,
such as "dt-bindings: leds: ti,lm3643: Document...". Missing the driver
portion of the prefix hinders Git history categorization and violates
subsystem naming conventions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011191026.1493=
38-1-rillian.grant@gmail.com?part=3D1
