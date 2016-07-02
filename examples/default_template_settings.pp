# The defaults as set by the 1.Y.Z template.

# Cassandra pre-requisites
include cassandra::datastax_repo
include cassandra::java

class { 'cassandra':
  settings => {
    'authenticator'                            => 'AllowAllAuthenticator',
    'authorizer'                               => 'AllowAllAuthorizer',
    'auto_snapshot'                            => true,
    'batch_size_warn_threshold_in_kb'          => 5,
    'batchlog_replay_throttle_in_kb'           => 1024,
    'cas_contention_timeout_in_ms'             => 1000,
    'client_encryption_options'                => {
      'enabled'           => false,
      'keystore'          => 'conf/.keystore',
      'keystore_password' => 'cassandra'
    },
    'cluster_name'                             => 'Test Cluster',
    'column_index_size_in_kb'                  => 64,
    'commit_failure_policy'                    => 'stop',
    'commitlog_directory'                      => '/var/lib/cassandra/commitlog',
    'commitlog_segment_size_in_mb'             => 32,
    'commitlog_sync'                           => 'periodic',
    'commitlog_sync_period_in_ms'              => 10000,
    'compaction_throughput_mb_per_sec'         => 16,
    'concurrent_counter_writes'                => 32,
    'concurrent_reads'                         => 32,
    'concurrent_writes'                        => 32,
    'counter_cache_save_period'                => 7200,
    'counter_cache_size_in_mb'                 => '',
    'counter_write_request_timeout_in_ms'      => 5000,
    'cross_node_timeout'                       => false,
    'data_file_directories'                    => ['/var/lib/cassandra/data'],
    'disk_failure_policy'                      => 'stop',
    'dynamic_snitch_badness_threshold'         => 0.1,
    'dynamic_snitch_reset_interval_in_ms'      => 600000,
    'dynamic_snitch_update_interval_in_ms'     => 100,
    'endpoint_snitch'                          => 'SimpleSnitch',
    'hinted_handoff_enabled'                   => true,
    'hinted_handoff_throttle_in_kb'            => 1024,
    'incremental_backups'                      => false,
    'index_summary_capacity_in_mb'             => '',
    'index_summary_resize_interval_in_minutes' => 60,
    'inter_dc_tcp_nodelay'                     => false,
    'internode_compression'                    => 'all',
    'key_cache_save_period'                    => 14400,
    'key_cache_size_in_mb'                     => '',
    'listen_address'                           => 'localhost',
    'max_hint_window_in_ms'                    => 10800000,
    'max_hints_delivery_threads'               => 2,
    'memtable_allocation_type'                 => 'heap_buffers',
    'native_transport_port'                    => 9042,
    'num_tokens'                               => 256,
    'partitioner'                              => 'org.apache.cassandra.dht.Murmur3Partitioner',
    'permissions_validity_in_ms'               => 2000,
    'range_request_timeout_in_ms'              => 10000,
    'read_request_timeout_in_ms'               => 5000,
    'request_scheduler'                        => 'org.apache.cassandra.scheduler.NoScheduler',
    'request_timeout_in_ms'                    => 10000,
    'row_cache_save_period'                    => 0,
    'row_cache_size_in_mb'                     => 0,
    'rpc_address'                              => 'localhost',
    'rpc_keepalive'                            => true,
    'rpc_port'                                 => 9160,
    'rpc_server_type'                          => 'sync',
    'saved_caches_directory'                   => '/var/lib/cassandra/saved_caches',
    'seed_provider'                            => [
      {
        'class_name' => 'org.apache.cassandra.locator.SimpleSeedProvider',
        'parameters' => [
          {
            'seeds' => '127.0.0.1'
          }
        ]
      }
    ],
    'server_encryption_options'                => {
      'internode_encryption' => 'none',
      'keystore'             => 'conf/.keystore',
      'keystore_password'    => 'cassandra',
      'truststore'           => 'conf/.truststore',
      'truststore_password'  => 'cassandra'
    },
    'snapshot_before_compaction'               => false,
    'ssl_storage_port'                         => 7001,
    'sstable_preemptive_open_interval_in_mb'   => 50,
    'start_native_transport'                   => true,
    'start_rpc'                                => true,
    'storage_port'                             => 7000,
    'thrift_framed_transport_size_in_mb'       => 15,
    'tombstone_failure_threshold'              => 100000,
    'tombstone_warn_threshold'                 => 1000,
    'trickle_fsync'                            => false,
    'trickle_fsync_interval_in_kb'             => 10240,
    'truncate_request_timeout_in_ms'           => 60000,
    'write_request_timeout_in_ms'              => 2000
  },
  require  => Class['cassandra::datastax_repo', 'cassandra::java'],
}
