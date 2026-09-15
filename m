Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E93AA1B2
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 03:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444354; cv=none; b=XxRcsZXKkUm+nwVYVYRNScdc74DspTo68L7aSnR7VGDpZy4IR7jYoAHZ/7Eh0cTkckRgDRT+LdB48AZv44H7/lG5357QlN2COXMcEE5YFzdpJU2VM5T1QwpznfCMNHKpUoTxLDruLvCrIJ3rapLlIFTYTWwHxrjinWnUq/NJncE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444354; c=relaxed/simple;
	bh=Slq/TBRHyeu1v2eZ0sRfsmgv1fUgBjz0rdOoX5wCujA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mAtWVxPiBqdZmNJmYLHV6XPTAr8wozzfroSw4JFdw1lRub5WMtXosywvF5hr076b61CpppWWyP4UXVvI/awGa0jWP3cJurSMXKqNKRwUYs3lzU0LVaoNaTxlXpdv5EbYEfF3X8YlVfKqglTmFEIf0EqX0eAbPakcfCPuuS8ueHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSmXEG82; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSmXEG82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78811F000FF;
	Tue, 15 Sep 2026 03:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789444353;
	bh=Slq/TBRHyeu1v2eZ0sRfsmgv1fUgBjz0rdOoX5wCujA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HSmXEG82/0VAnuXCpA8ICxzMh17D9gDOp7PRkj9gKVbpgj+STyBYZjU0uxJU7z4Py
	 Swat8lbKzggNhTwvDi4eTDdpIgDqzHyUYY8RZ/aHJhD0E1ztdY1YcU5DjmtI3df5mC
	 B9z5W3YkfhUEk8STd+ghXWqUPBU78o7LmdL2T+Cge9W/uAtjDCEZw+UJnocPuyK88u
	 HHgGiTtEQLOruKdtYSN1bDW9jyBNDp1jVyoUU03u4oMYQpXhtCT0j3yYVkp0+ZZaE0
	 fE0ylsuaZ0zyxubV3tE5UfdCEL9TpUhm7AaplkVwAK2VxpZBvB2EJuCjp7mEFMB8RT
	 Lgf/geTbfUXDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lm3692x: fix regulator/gpio leak and wrong
 enabled state on last write failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260915034515.4147981-1-congnt264@gmail.com>
References: <20260915034515.4147981-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 03:52:32 +0000
Message-Id: <20260915035232.C78811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message description is not capitalized
--

commit b25c5a499c39fb9de3dfd21fd5b2889e97d97b83
Author: Cong Nguyen <congnt264@gmail.com>

leds: lm3692x: fix regulator/gpio leak and wrong enabled state on last writ=
e failure

This commit addresses an error handling omission in lm3692x_leds_enable(), =
where
the final write ignores its return value and marks the LED as enabled even =
on
failure. Routing this through the standard error path prevents regulator le=
aks
and ensures proper retry behavior.

> leds: lm3692x: fix regulator/gpio leak and wrong enabled state on last wr=
ite failure

[Severity: Low]
This isn't a bug, but does the commit subject violate the LED subsystem
convention for capitalization? The subsystem guidelines require capitalizing
the description after the prefix (e.g., "leds: lm3692x: Fix regulator...").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915034515.4147=
981-1-congnt264@gmail.com?part=3D1
