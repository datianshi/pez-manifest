tmpdir=$(mktemp -d /tmp/diego-manifest.XXXXX)

spiff merge \
  manifest-generation/config-from-cf.yml \
  manifest-generation/config-from-cf-internal.yml \
  ../cf/cf.yml \
  > ${tmpdir}/config-from-cf.yml

spiff merge \
  manifest-generation/diego.yml \
  manifest-generation/bosh-lite-stubs/property-overrides.yml \
  manifest-generation/bosh-lite-stubs/instance-count-overrides.yml \
  vcloud-iaas-settings.yml \
  stub.yml \
  ${tmpdir}/config-from-cf.yml \
  > ${tmpdir}/diego.yml

spiff merge \
  manifest-generation/misc-templates/bosh.yml \
  ${tmpdir}/diego.yml
